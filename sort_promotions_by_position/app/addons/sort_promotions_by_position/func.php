<?php

function fn_sort_promotions_by_position_get_promotions($params, $fields, &$sortings, $condition, $join, $group, $lang_code) {
    $sortings['position'] = '?:promotions.position';
}
