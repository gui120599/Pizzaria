<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    use HasFactory;
    protected $fillable = [
        "categoria_nome"
    ];

    public function produtos()
    {
        return $this->hasMany(Produto::class, "produto_categoria_id");
    }
}
