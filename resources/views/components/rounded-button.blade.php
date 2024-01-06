<button {{ $attributes->merge(['type' => 'submit', 'class' => 'inline-flex p-1 items-center border border-transparent  font-semibold text-white dark:text-gray-800 uppercase tracking-widest hover:bg-gray-700 dark:hover:bg-white focus:bg-gray-700 dark:focus:bg-white active:bg-gray-900 dark:active:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 dark:focus:ring-offset-gray-800 transition ease-in-out duration-700']) }}>
    {{ $slot }}
</button>
