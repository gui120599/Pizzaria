<section>
    <header>
        <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">
            {{ __('Novo Pagamento') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
            {{ __('Insira os dados para novo pagamento.') }}
        </p>
    </header>

    <form action="{{ route('pagamento.store') }}" method="post" class="mt-6 space-y-6" enctype="multipart/form-data">
        @csrf

        <div>
            <x-input-label for="pagamento_nome" :value="__('Nome do Pagamento')" />
            <x-text-input id="pagamento_nome" name="pagamento_nome" type="text" class="mt-1 w-full" autofocus/>
            <x-input-error :messages="$errors->updatePassword->get('pagamento_nome')" class="mt-2" />
        </div>
        <x-primary-button>
            {{ __('Cadastrar Novo Pagamento') }}
        </x-primary-button>

    </form>
</section>
