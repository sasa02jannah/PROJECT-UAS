<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    public function addTransaction(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'amount' => 'required|numeric',
            'type' => 'required|in:income,expense',
            'category_id' => 'required|exists:categories,id',
            'description' => 'nullable|string',
        ]);

        $transaction = Transaction::create($request->all());
        
        // saldo sekarang
        $income = Transaction::where('user_id', $request->user_id)
            ->where('type', 'income')
            ->sum('amount');

        $expense = Transaction::where('user_id', $request->user_id)
            ->where('type', 'expense')
            ->sum('amount');

        $balance = $income - $expense;

        $transaction->balance = $balance;

        return response()->json(['status' => 'success', 'message' => 'Transaction added successfully', 'transaction' => $transaction], 201);
    }

    public function topup(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'amount' => 'required|numeric',
            'description' => 'nullable|string',
        ]);

        $transaction = new Transaction();
        $transaction->user_id = $request->user_id;
        $transaction->amount = $request->amount;
        $transaction->type = 'income'; 
        $transaction->category_id = 4; 
        $transaction->description = $request->description;
        $transaction->save();
        
        // saldo sekarang
        $income = Transaction::where('user_id', $request->user_id)
            ->where('type', 'income')
            ->sum('amount');

        $expense = Transaction::where('user_id', $request->user_id)
            ->where('type', 'expense')
            ->sum('amount');

        $balance = $income - $expense;

        $transaction->balance = $balance;

        return response()->json(['status' => 'success', 'message' => 'Topup  successfully via '.$request->description, 'transaction' => $transaction], 201);
    }

    public function qris(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'amount' => 'required|numeric',
            'description' => 'nullable|string',
        ]);

        $transaction = new Transaction();
        $transaction->user_id = $request->user_id;
        $transaction->amount = $request->amount;
        $transaction->type = 'expense'; 
        $transaction->category_id = 5; 
        $transaction->description = $request->description;
        $transaction->save();
        
        // saldo sekarang
        $income = Transaction::where('user_id', $request->user_id)
            ->where('type', 'income')
            ->sum('amount');

        $expense = Transaction::where('user_id', $request->user_id)
            ->where('type', 'expense')
            ->sum('amount');

        $balance = $income - $expense;

        $transaction->balance = $balance;

        return response()->json(['status' => 'success', 'message' => 'Transaction via QRIS successfully', 'transaction' => $transaction], 201);
    }

    public function listTransactions(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $transactions = Transaction::where('user_id', $request->user_id)
            ->whereBetween('created_at', [$request->start_date, $request->end_date])
            ->get();

        return response()->json(['status' => 'success', 'transactions' => $transactions, 'start_date' => $request->start_date, 'end_date' => $request->end_date], 200);
    }

    public function reportSummary(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'period' => 'required|in:daily,monthly,yearly',
        ]);

        $query = Transaction::where('user_id', $request->user_id);

        if ($request->period == 'daily') {
            $query->whereDate('created_at', now()->toDateString());
        } elseif ($request->period == 'monthly') {
            $query->whereMonth('created_at', now()->month);
        } elseif ($request->period == 'yearly') {
            $query->whereYear('created_at', now()->year);
        }

        $income = $query->where('type', 'income')->sum('amount');
        $expense = $query->where('type', 'expense')->sum('amount');
        $balance = $income - $expense;

        return response()->json([
            'status' => 'success',
            'requested' => $request->period,
            'balance' => $balance,
            'total_income' => $income,
            'total_expense' => $expense,
        ], 200);
    }
    public function updateTransaction(Request $request, $id)
    {
        $request->validate([
            'amount' => 'nullable|numeric',
            'type' => 'nullable|in:income,expense',
            'category_id' => 'nullable|exists:categories,id',
            'description' => 'nullable|string',
        ]);

        $transaction = Transaction::findOrFail($id);
        $transaction->update($request->only(['amount', 'type', 'category_id', 'description']));

        return response()->json(['status' => 'success', 'message' => 'Transaction updated successfully', 'transaction' => $transaction], 200);
    }

    public function deleteTransaction($id)
    {
        $transaction = Transaction::findOrFail($id);
        $transaction->delete();

        return response()->json(['status' => 'success', 'message' => 'Transaction deleted successfully'], 200);
    }
}
