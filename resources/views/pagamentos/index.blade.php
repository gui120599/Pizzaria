<x-app-layout>
    <x-slot name="header">
        <a href="">
            <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                {{ __('Pagamento') }}
            </h2>
        </a>
    </x-slot>

    <div class="">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
            <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                <div class="max-w-xl">
                    @include('pagamentos.partials.create')
                </div>
            </div>

            <div class="p-4 sm:p-1 shadow sm:rounded-lg">
                <div class="max-w-full">
                    @include('pagamentos.partials.list')
                </div>
            </div>

            {{--<div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                <div class="max-w-xl">
                     @include('profile.partials.delete-user-form') 
                </div>
            </div>--}}
        </div>
    </div>
</x-app-layout>
