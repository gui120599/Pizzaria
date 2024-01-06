<section>
    <header>
        <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">
            {{ __('Atualizar Cadastros do Produto') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
            {{ __('Altere os dados do produto.') }}
        </p>
    </header>

    <form action="{{ route('produto.update', ['produto'=> $produto]) }}" method="post" class="mt-6 space-y-6" enctype="multipart/form-data">
        
        @csrf
        @method('patch')

        <div>
            <x-input-label for="produto_nome" :value="__('Nome do Produto')" />
            <x-text-input id="produto_nome" name="produto_nome" type="text" class="mt-1 w-full"
                value="{{ $produto->produto_nome }}" />
            <x-input-error :messages="$errors->updatePassword->get('produto_nome')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_descricao" :value="__('Descricao do Produto')" />
            <x-text-area id="produto_descricao" name="produto_descricao" class="mt-1 w-full" :valor=" $produto->produto_descricao " />
            <x-input-error :messages="$errors->updatePassword->get('produto_descricao')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_categoria_id" :value="__('Categoria do Produto')" />
            <x-select-input :options="$categorias" value-field="id" display-field="categoria_nome" :selectedValue=" $produto->produto_categoria_id " id="produto_categoria_id"
                name="produto_categoria_id" class="mt-1 w-full" />
            <x-input-error :messages="$errors->updatePassword->get('produto_categoria_id')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_tamanho" :value="__('Tamanho do Produto')" />
            <x-text-input id="produto_tamanho" name="produto_tamanho" type="text" class="mt-1 w-full"
                value="{{ $produto->produto_tamanho }}" />
            <x-input-error :messages="$errors->updatePassword->get('produto_tamanho')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_preco_custo" :value="__('Preço Custo R$')" />
            <x-text-input id="produto_preco_custo" name="produto_preco_custo" type="text" class="mt-1 w-full"
                value="{{ str_replace('.', ',', $produto->produto_preco_custo) }}" />
            <x-input-error :messages="$errors->updatePassword->get('produto_preco_custo')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_preco_venda" :value="__('Preço Venda R$')" />
            <x-text-input id="produto_preco_venda" name="produto_preco_venda" type="text" class="mt-1 w-full"
                value="{{ str_replace('.', ',', $produto->produto_preco_venda) }}" />
            <x-input-error :messages="$errors->updatePassword->get('produto_preco_venda')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_foto" :value="__('Foto do Produto')" />
            <div class="flex items-start justify-between w-full">
                <x-text-input id="produto_foto" name="produto_foto" type="file"
                    class="mt-1 max-w-full cursor-pointer" onchange="previewImage(this)" />
                <img id="imagem-preview" class=" ml-2 max-w-full border rounded-lg object-contain w-40 h-40" src="{{ asset('img/fotos_produtos/' . $produto->produto_foto) }}"
                alt="{{ $produto->produto_nome }}" />
            </div>
            <x-input-error :messages="$errors->updatePassword->get('produto_foto')" class="mt-2" />
        </div>
        <x-primary-button>
            {{ __('Atualizar Cadastro') }}
        </x-primary-button>


    </form>
    <script>
        function previewImage(input) {
            var preview = document.getElementById('imagem-preview');
            var file = input.files[0];
            var reader = new FileReader();

            reader.onloadend = function() {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
</section>
