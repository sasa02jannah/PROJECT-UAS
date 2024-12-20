<?php

use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\TransactionController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware(['auth:sanctum', 'admin'])->group(function () {
    
    Route::post('/category/store', [AdminController::class, 'store']);
    Route::put('/category/update/{id}', [AdminController::class, 'update']);
    Route::delete('/category/delete/{id}', [AdminController::class, 'delete']);
});

Route::middleware('guest')->group(function () {
    Route::post('/register', [UserController::class, 'register']);
    Route::post('/login', [UserController::class, 'login']);
});

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/category/list', [AdminController::class, 'index']);
});

Route::middleware(['auth:sanctum', 'user'])->group(function () { 
    // Route::get('/category_user/list', [AdminController::class, 'index']);
    Route::post('/transaction/add', [TransactionController::class, 'addTransaction']);
    Route::post('/transaction/topup', [TransactionController::class, 'topup']);
    Route::post('/transaction/qris', [TransactionController::class, 'qris']);
    Route::get('/transaction/list', [TransactionController::class, 'listTransactions']);
    Route::get('/transaction/report', [TransactionController::class, 'reportSummary']);
    Route::put('/transaction/update/{id}', [TransactionController::class, 'updateTransaction']);
    Route::delete('/transaction/delete/{id}', [TransactionController::class, 'deleteTransaction']);
});
