<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use App\Models\Produto;
use App\Http\Requests\StoreProdutoRequest;
use App\Http\Requests\UpdateProdutoRequest;

class ProdutoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //$produtos = Produto::with('categoria')->get();
        $categorias = Categoria::with('produtos')->get();

        // Consulta para obter os produtos inativos (soft deleted)
        $produtosInativos = Produto::onlyTrashed()->get();

    return view('produtos.index', ['produtosInativos' => $produtosInativos,  'categorias' => $categorias/*, 'produtos' => $produtos,*/]);
    }

    /**
     * Display a listing inactive.
     */
    public function inactive()
    {
        // Consulta para obter os produtos inativos (soft deleted)
        $produtosInativos = Produto::onlyTrashed()->get();

        return view('produtos.inactive', ['produtosInativos' => $produtosInativos]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreProdutoRequest $request)
    {
        if ($request->input('produto_preco_custo') === null || $request->input('produto_preco_custo') === '') {
            $preco_custo = 0.00;
        } else {
            $preco_custo = str_replace(',', '.', $request->input('produto_preco_custo'));
        }

        // Criação do produto
        $produto = Produto::create([
            'produto_nome' => $request->input('produto_nome'),
            'produto_descricao' => $request->input('produto_descricao'),
            'produto_categoria_id' => $request->input('produto_categoria_id'),
            'produto_preco_custo' => $preco_custo,
            'produto_preco_venda' => str_replace(',', '.', $request->input('produto_preco_venda')),
            'produto_tamanho' => $request->input('produto_tamanho'),
        ]);

        // Upload da foto, se presente
        if ($request->hasFile('produto_foto')) {
            $foto = $request->file('produto_foto');
            $produto->saveFoto($foto);
        }

        $produto->save();

        // Redireciona para a página do produto recém-criado
        return redirect()->route('produto')->with('success', 'Produto criado com sucesso!');
    }


    /**
     * Display the specified resource.
     */
    public function show(Produto $produto)
    {
        return view('produtos.show', ['produto' => $produto]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Produto $produto)
    {
        $categorias = Categoria::all();
        return view('produtos.edit', ['produto' => $produto], ['categorias' => $categorias]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateProdutoRequest $request, Produto $produto)
    {
        //dd($request);
        /* // Validação dos dados
         /*$request->validate([
             'produto_nome' => 'required|string',
             'produto_descricao' => 'required|string',
             'produto_categoria_id' => 'required|exists:categorias,id',
             'produto_preco_custo' => 'nullable|numeric',
             'produto_preco_venda' => 'required|numeric',
             'produto_tamanho' => 'nullable|string',
             'produto_foto' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
         ]);*/

        // Lógica para tratamento do preço de custo
        $preco_custo = $request->filled('produto_preco_custo')
            ? str_replace(',', '.', $request->input('produto_preco_custo'))
            : 0.00;

        // Atualização dos dados do produto
        $produto->update([
            'produto_nome' => $request->input('produto_nome'),
            'produto_descricao' => $request->input('produto_descricao'),
            'produto_categoria_id' => $request->input('produto_categoria_id'),
            'produto_preco_custo' => $preco_custo,
            'produto_preco_venda' => str_replace(',', '.', $request->input('produto_preco_venda')),
            'produto_tamanho' => $request->input('produto_tamanho'),
        ]);

        // Upload da nova foto, se presente
        if ($request->hasFile('produto_foto')) {
            $foto = $request->file('produto_foto');
            $produto->saveFoto($foto);
        }

        // Redireciona para a página do produto atualizado
        return redirect()->route('produto')->with('success', 'Produto atualizado com sucesso!');
    }


    /**
     * Active object.
     */
    public function active(Produto $produto, $id)
    {
        $produto = Produto::withTrashed()->find($id);

        if (!$produto) {
            return redirect('/Produto-Inativos')->with('error', 'Produto não encontrado!');
        }
        $produto->restore();
        return redirect('/Produto')->with('success', 'Produto Ativado com sucesso');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Produto $produto, $id)
    {
        $produto = Produto::find($id);

        if (!$produto) {
            return redirect('/Produto')->with('error', 'Produto não encontrado!');
        }
        $produto->delete();
        return redirect('/Produto')->with('success', 'Produto Inativado com sucesso');
    }
}
