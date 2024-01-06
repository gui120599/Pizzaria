<section>
    <header>
        <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">
            {{ __('Novo Produto') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
            {{ __('Insira os dados para novo produto.') }}
        </p>
    </header>

    <form action="{{ route('produto.store') }}" method="post" class="mt-6 space-y-6" enctype="multipart/form-data">
        @csrf

        <div>
            <x-input-label for="produto_nome" :value="__('Nome do Produto')" />
            <x-text-input id="produto_nome" name="produto_nome" type="text" class="mt-1 w-full" autofocus/>
            <x-input-error :messages="$errors->updatePassword->get('produto_nome')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_descricao" :value="__('Descricao do Produto')" />
            <x-text-area id="produto_descricao" name="produto_descricao" class="mt-1 w-full" />
            <x-input-error :messages="$errors->updatePassword->get('produto_descricao')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_categoria_id" :value="__('Categoria do Produto')" />
            <x-select-input :options="$categorias" value-field="id" display-field="categoria_nome" id="produto_categoria_id" name="produto_categoria_id" class="mt-1 w-full" />
            <x-input-error :messages="$errors->updatePassword->get('produto_categoria_id')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_tamanho" :value="__('Tamanho do Produto')" />
            <x-text-input id="produto_tamanho" name="produto_tamanho" type="text" class="mt-1 w-full" />
            <x-input-error :messages="$errors->updatePassword->get('produto_tamanho')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_preco_custo" :value="__('Preço Custo R$')" />
            <x-text-input id="produto_preco_custo" name="produto_preco_custo" type="text" class="mt-1 w-full" />
            <x-input-error :messages="$errors->updatePassword->get('produto_preco_custo')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_preco_venda" :value="__('Preço Venda R$')" />
            <x-text-input id="produto_preco_venda" name="produto_preco_venda" type="text" class="mt-1 w-full" />
            <x-input-error :messages="$errors->updatePassword->get('produto_preco_venda')" class="mt-2" />
        </div>
        <div>
            <x-input-label for="produto_foto" :value="__('Foto do Produto')" />
            <div class="flex items-start justify-between w-full">
                <x-text-input id="produto_foto" name="produto_foto" type="file" class="mt-1 max-w-full cursor-pointer"
                    onchange="previewImage(this)" />
                <img id="imagem-preview" class=" ml-2 max-w-full border rounded-lg object-contain w-40 h-40" />
            </div>
            <x-input-error :messages="$errors->updatePassword->get('produto_foto')" class="mt-2" />
        </div>
        <x-primary-button>
            {{ __('Cadastrar Novo Produto') }}
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
