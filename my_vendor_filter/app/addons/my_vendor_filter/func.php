<?php

use Tygh\Enum\SiteArea;

function fn_my_vendor_filter_get_product_filter_fields(&$filters)
{
    $filters['V'] = [
        'db_field' => 'company_id',
        'table' => 'products',
        'description' => 'my_vendor_filter.featured_vendor_filter',
        'condition_type' => 'F',
        'variant_name_field' => 'companies.company',
        'conditions' => static function ($db_field, $join, $condition) {
            if (SiteArea::isAdmin(AREA)) {
                $join .= db_quote('INNER JOIN ?:companies as companies ON companies.company_id = products.company_id');
            }

            return [$db_field, $join, $condition];
        },
    ];
}

function fn_my_vendor_filter_get_current_filters_after_variants_select_query(
    array $params,
    array $filters,
    array $selected_filters,
    $area,
    $lang_code,
    array $variant_values,
    array &$field_variant_values,
    $filter_id,
    array $filter,
    &$result,
    $fields_join,
    $products_table_base_joins,
    $fields_where,
    $products_table_base_conditions
) {
    if ($filter['field_type'] !== 'V' || empty($result)) {
        return;
    }

    $featured_vendors = db_get_hash_array("SELECT company_id from ?:companies WHERE is_featured_vendor = 'Y'", 'company_id');

    $result = $field_variant_values[$filter_id]['variants'] = fn_array_key_intersect($result, $featured_vendors);
}