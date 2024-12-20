<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'category_name' => 'required|string',
            'description' => 'nullable|string',
        ]);

        $category = Category::create([
            'category_name' => $request->category_name,
            'description' => $request->description,
        ]);

        return response()->json(['status' => 'success', 'message' => 'Category added successfully', 'category' => $category], 201);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'category_name' => 'required|string',
            'description' => 'nullable|string',
        ]);

        $category = Category::find($id);

        if ($category) {
            $category->update([
                'category_name' => $request->category_name,
                'description' => $request->description,
            ]);

            return response()->json(['status' => 'success', 'message' => 'Category updated successfully', 'category' => $category], 200);
        } else {
            return response()->json(['status' => 'error', 'message' => 'Category not found'], 404);
        }
    }

    public function delete(Request $request, $id)
    {
        $category = Category::find($id);

        if ($category) {
            $category->delete();
            return response()->json(['status' => 'success', 'message' => 'Category deleted successfully'], 200);
        } else {
            return response()->json(['status' => 'error', 'message' => 'Category not found'], 404);
        }
    }
    public function index()
    {
        $categories = Category::all();
        return response()->json(['status' => 'success', 'categories' => $categories], 200);
    }
}
