<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Produto extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $dates = ['deleted_at'];
    protected $fillable = [
        "produto_nome",
        "produto_descricao",
        "produto_categoria_id",
        "produto_tamanho",
        "produto_preco_custo",
        "produto_preco_venda",
        "produto_foto",
    ];

    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'produto_categoria_id'); // 'categoria_id' é a chave estrangeira na tabela 'produtos'
    }

    public function saveFoto($foto)
    {
        $nomeArquivo = time() . '.' . $foto->getClientOriginalExtension();
        $caminho = public_path('/img/fotos_produtos');
        $foto->move($caminho, $nomeArquivo);
        $this->produto_foto = $nomeArquivo;
        $this->save();
    }
}
