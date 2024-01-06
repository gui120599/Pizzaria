<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Produtos Inativos') }}
        </h2>
    </x-slot>

    <div class="">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
            <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                <div class="w-full">
                    <section id="inativos" class="">
                        <header>
                            <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">
                                {{ __('Produtos Inativos') }}
                            </h2>

                            <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
                                {{ __('Todos produtos que foram excluídos!') }}
                            </p>
                        </header>
                        <x-text-input-buscar id="buscar" class="mt-3 mb-3 w-1/2"
                            placeholder="Buscar"></x-text-input-buscar>
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 gap-2 sm:gap-4">
                            @foreach ($produtosInativos as $produto)
                                <div class="relative">
                                    <a href="{{ route('produto.show', ['produto' => $produto]) }}" class="">
                                        <div
                                            class="w-full bg-zinc-800 p-2 rounded-lg flex items-start justify-between opacity-95 hover:opacity-100 gap-1">
                                            <div class="w-3/5 h-28 flex flex-col justify-between">
                                                <h2 class="text-white text-sm uppercase">{{ $produto->produto_nome }} -
                                                    {{ $produto->produto_tamanho }}</h2>
                                                <p
                                                    class="text-gray-400 text-xs max-w-xl overflow-hidden whitespace-normal line-clamp-3">
                                                    {{ $produto->produto_descricao }}
                                                </p>
                                                <div class="flex items-center">
                                                    <span
                                                        class="text-white text-lg font-bold">R${{ str_replace('.', ',', $produto->produto_preco_venda) }}</span>
                                                </div>
                                            </div>
                                            <div class="w-2/5">
                                                <img src="{{ asset('img/fotos_produtos/' . $produto->produto_foto) }}"
                                                    alt="{{ $produto->produto_nome }}"
                                                    class="w-40 h-28 object-cover rounded-lg ">
                                            </div>
                                        </div>
                                    </a>
                                    <div class="absolute -bottom-2 right-5 inline-flex gap-2">
                                        <x-primary-button
                                            onclick="window.location.href = '{{ route('produto.active', ['id' => $produto->id]) }}'">Ativar</x-primary-button>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
