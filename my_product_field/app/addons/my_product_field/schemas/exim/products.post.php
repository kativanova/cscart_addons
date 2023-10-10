<?php

$schema['export_fields']['Name for Google'] = array(
    'table'       => 'product_descriptions',
    'db_field'    => 'product_google_name',
    'multilang'   => true,
    'process_get' => ['fn_export_product_descr', '#key', '#this', '#lang_code', 'product_google_name'],
    'process_put' => ['fn_import_product_descr', '#this', '#key', 'product_google_name', '#new'],
);

return $schema;