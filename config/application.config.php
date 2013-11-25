<?php
return array(
    'modules' => array(
        'EdpSuperluminal',
        'ZfcBase',
        'DoctrineModule',
        'DoctrineMongoODMModule',
        'Deal',
    ),

    'module_listener_options' => array(
        'module_paths' => array(
            './module',
            './vendor',
        ),
        'config_glob_paths' => array(
            'config/autoload/{,*.}{global,local}.php',
        ),
        'config_cache_enabled' => false,
        'config_cache_key' => 'config_cache_',

        'module_map_cache_enabled' => false,
        'module_map_cache_key' => 'module_cache_',

        'cache_dir' => 'data/cache/',
        'check_dependencies' => true,
    ),
);
