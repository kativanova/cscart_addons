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


//
// [anikolaychenko]
//

use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_confirmation_message_place_order($order_id, $action, $__order_status, $cart){
	foreach ((array)$cart['products'] as $k => $v) {
	    $full_diskription = db_get_field("SELECT full_description FROM ?:product_descriptions WHERE product_id = ?i", $v['product_id']);
	    $short_diskription = db_get_field("SELECT short_description FROM ?:product_descriptions WHERE product_id = ?i", $v['product_id']);
	    db_query('UPDATE ?:order_details SET ?:order_details.full_description=?s WHERE product_id = ?i AND order_id = ?i',$full_diskription, $v['product_id'], $order_id);
	    db_query('UPDATE ?:order_details SET ?:order_details.short_description=?s WHERE product_id = ?i AND order_id = ?i',$short_diskription, $v['product_id'], $order_id);
	}
}

function fn_confirmation_message_send_order_notification(&$order_info){
	fn_gather_additional_products_data($order_info['products'], array('get_icon' => true, 'get_detailed' => true, 'get_options' => true, 'get_discounts' => true, 'get_features' => false));

	//fn_print_die($order_info['products']);
}

function fn_get_product_icon($order_id) {
	  $order_info = fn_get_order_info($order_id);   
	  fn_gather_additional_products_data($order_info['items'], array('get_icon' => true, 'get_detailed' => true, 'get_options' => true, 'get_discounts' => true, 'get_features' => false));
	  return $order_info;
}

