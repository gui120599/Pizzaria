<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="icon" type="image/png" href="{{ asset('Icone.png') }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <link rel="stylesheet" href="{{ asset('css/style.css') }}">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="font-sans antialiased">
    <div class="min-h-screen bg-black">
        @include('layouts.navigation')

        <!-- Page Heading -->
        @if (isset($header))
            <header class="">
                <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                    {{ $header }}
                </div>
            </header>
        @endif

        <!-- Page Content -->
        <main>
            {{ $slot }}
        </main>
        <footer class="max-w-7xl mx-auto p-7">
            <hr class="bg-gray-400 mb-7">
            <div class="flex justify-between">
                <a href="/">
                    <x-application-logo class="h-12" />
                </a>
                <p class="text-gray-400">© 2024 {{ config('app.name', 'Laravel') }}</p>
            </div>
        </footer>
        <div>
            <x-toats></x-toats>
        </div>
    </div>
</body>

</html>
