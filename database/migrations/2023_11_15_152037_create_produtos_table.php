<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('produtos', function (Blueprint $table) {
            $table->id();
            $table->string('produto_nome');
            $table->string('produto_descricao')->nullable();
            $table->unsignedBigInteger('produto_categoria_id');
            $table->string('produto_tamanho')->nullable();
            $table->decimal('produto_preco_custo',7,2)->nullable();
            $table->decimal('produto_preco_venda',7,2);
            $table->string('produto_foto')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('produto_categoria_id')->references('id')->on('categorias');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('produtos');
    }
};
