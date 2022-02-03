<?php
/***************************************************************************
*                                                                          *
*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
*                                                                          *
* This  is  commercial  software,  only  users  who have purchased a valid *
* license  and  accept  to the terms of the  License Agreement can install *
* and use this program.                                                    *
*                                                                          *
****************************************************************************
* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
****************************************************************************/

use Tygh\Registry;
use Tygh\Languages\Languages;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_my_avanced_product_search_get_products($params, $fields, $sortings, &$condition, $join, $sorting, $group_by, $lang_code, $having)
{
    if (empty($params['cid'])) {
        return;
    }
    $cids = is_array($params['cid']) ? $params['cid'] : explode(',', $params['cid']);
    if (count($cids) === 1 && isset($params['only_cid'])) {
        $condition .= db_quote(
            ' AND NOT EXISTS (' .
            ' SELECT *' .
            ' FROM ?:products_categories b' .
            ' WHERE products.product_id = b.product_id AND b.category_id <> ?i)',
            $cids[0]
        );
    }
}
