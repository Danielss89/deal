<?php

return array(
    'router' => array(
        'routes' => array(
            'base' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/[:controller[/:id]]',
                    'defaults' => array(
                        'controller'    => 'Base',
                    ),
                ),
            ),
        ),
    ),
    'controllers' => array(
        'invokables' => array(
            'Base' => 'Deal\Controller\BaseController'
        ),
    ),
    'view_manager' => array(
        'strategies' => array(
            'ViewJsonStrategy'
        ),
    ),
    'doctrine' => array(
        'driver' => array(
            'deal_driver' => array(
                'class' => 'Doctrine\ODM\MongoDB\Mapping\Driver\AnnotationDriver',
                'paths' => __DIR__ . '/../src/Deal/Document'
            ),

            'odm_default' => array(
                'drivers' => array(
                    'Deal' => 'deal_driver'
                )
            )
        )
    )
);
