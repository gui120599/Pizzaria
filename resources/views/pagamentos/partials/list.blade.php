<section>
    <header>
        <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">
            {{ __('Pagamentos') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
            {{ __('Todos pagamentos cadastrados!') }}
        </p>
    </header>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-2 sm:gap-4">
        @foreach ($pagamentos as $pagamento)
            <div class="relative">
                <a href="{{ route('pagamento.edit', ['pagamento'=> $pagamento]) }}" class="">
                    <div
                        class="w-full bg-zinc-800 p-4 rounded-lg flex items-start justify-between opacity-95 hover:opacity-100 gap-1">
                        <div class="w-3/5 h-28 flex flex-col justify-between">
                            <h2 class="text-white text-sm uppercase">{{ $pagamento->pagamento_nome }}</h2>
                        </div>
                    </div>
                </a>
                <div class="absolute -bottom-2 right-5 inline-flex gap-2">
                    <x-primary-button  onclick="window.location.href = '{{ route('pagamento.edit', ['pagamento'=> $pagamento]) }}'">Editar</x-primary-button>
                    <form action="{{ route('pagamento.destroy', ['id' => $pagamento]) }}" method="post">
                        @method('delete')
                        @csrf
                        <x-danger-button>Excluir</x-primary-button>
                    </form>
                </div>
            </div>
        @endforeach
    </div>
</section>
