<?php

namespace App\Http\Controllers;

use App\Models\Pagamento;
use App\Http\Requests\StorePagamentoRequest;
use App\Http\Requests\UpdatePagamentoRequest;

class PagamentoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $pagamentos = Pagamento::all();
        return view('pagamentos.index', ['pagamentos' => $pagamentos]);
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
    public function store(StorePagamentoRequest $request)
    {
        $pagamento = Pagamento::create([
            'pagamento_nome' => $request->input('pagamento_nome'),
        ]);

        $pagamento->save();

        // Redireciona para a página da pagamento recém-criada
        return redirect()->route('pagamento')->with('success', 'Pagamento criada com sucesso!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Pagamento $pagamento)
    {
        return view('pagamentos.show', ['pagamento' => $pagamento]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Pagamento $pagamento)
    {
    
        return view('pagamentos.edit', ['pagamento' => $pagamento]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePagamentoRequest $request, Pagamento $pagamento)
    {
        $pagamento->update([
            'pagamento_nome' => $request->input('pagamento_nome'),
        ]);

        // Redireciona para a página da pagamento recém-criada
        return redirect()->route('pagamento')->with('success', 'Pagamento atualizada com sucesso!');
    
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Pagamento $pagamento, $id)
    {
        $pagamento = Pagamento::find($id);

        if (!$pagamento) {
            return redirect('/Pagamento')->with('error', 'Pagamento não encontrada!');
        }
        $pagamento->delete();
        return redirect('/Pagamento')->with('success', 'Pagamento Inativada com sucesso');
    }
}
