<?php

$schema['products']['content']['items']['fillings']['by_the_same_vendor'] = array (
    'params' => array (
        'by_the_same_vendor' => true,
        'request' => array (
            'main_product_id' => '%PRODUCT_ID%'
        )
    )
);

$schema['vendor_terms'] = array(
    'templates' => 'addons/my_vendor_block/blocks/vendor_terms.tpl',
    'wrappers' => 'blocks/wrappers',
    'content' => array(
        'vendor_info' => array(
            'type' => 'function',
            'function' => array('fn_blocks_get_vendor_info'),
        )
    ),
);

return $schema;
