<?php

$schema['by_the_same_vendor'] = array (
    'limit' => array (
        'type' => 'input',
        'default_value' => 3,
    ),
    'similar_category' => array (
        'type' => 'checkbox',
        'default_value' => 'Y'
    ),
    'similar_subcats' => array (
        'type' => 'checkbox',
        'default_value' => 'Y'
    ),
    'similar_in_stock' => array (
        'type' => 'checkbox',
        'default_value' => 'Y'
    ),
);

return $schema;
