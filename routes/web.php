<?php

use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\PagamentoController;
use App\Http\Controllers\ProdutoController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get('/Produto', [ProdutoController::class, 'index'])->name('produto');
    Route::get('/Produto-Inativos', [ProdutoController::class, 'inactive'])->name('produto.inativos');
    Route::post('/Produto', [ProdutoController::class, 'store'])->name('produto.store');
    Route::get('/Produto/{id}', [ProdutoController::class, 'active'])->name('produto.active');
    Route::get('/Produto/{produto}', [ProdutoController::class, 'show'])->name('produto.show');
    Route::get('/Produto/{produto}/Editar', [ProdutoController::class, 'edit'])->name('produto.edit');
    Route::patch('/Produto/{produto}', [ProdutoController::class, 'update'])->name('produto.update');
    Route::delete('/Produto/{id}', [ProdutoController::class, 'destroy'])->name('produto.destroy');

    Route::get('/Categoria', [CategoriaController::class, 'index'])->name('categoria');
    Route::post('/Categoria', [CategoriaController::class, 'store'])->name('categoria.store');
    Route::get('/Categoria/{categoria}', [CategoriaController::class, 'show'])->name('categoria.show');
    Route::get('/Categoria/{categoria}/Editar', [CategoriaController::class, 'edit'])->name('categoria.edit');
    Route::patch('/Categoria/{categoria}', [CategoriaController::class, 'update'])->name('categoria.update');
    Route::delete('/Categoria/{id}', [CategoriaController::class, 'destroy'])->name('categoria.destroy');
    
    Route::get('/Pagamento', [PagamentoController::class, 'index'])->name('pagamento');
    Route::post('/Pagamento', [PagamentoController::class, 'store'])->name('pagamento.store');
    Route::get('/Pagamento/{pagamento}', [PagamentoController::class, 'show'])->name('pagamento.show');
    Route::get('/Pagamento/{pagamento}/Editar', [PagamentoController::class, 'edit'])->name('pagamento.edit');
    Route::patch('/Pagamento/{pagamento}', [PagamentoController::class, 'update'])->name('pagamento.update');
    Route::delete('/Pagamento/{id}', [PagamentoController::class, 'destroy'])->name('pagamento.destroy');
});

require __DIR__.'/auth.php';
