<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_order_status_change_date_install() {
   list($orders) = fn_get_orders([]);
   
   foreach($orders as $order) {
      db_query('UPDATE ?:orders SET status_updated_at = ?i WHERE order_id = ?i', $order['timestamp'], $order['order_id']);
   }
}

function fn_order_status_change_date_pre_get_orders($params, &$fields, $sortings, $get_totals, $lang_code)
{
   array_push($fields, '?:orders.status_updated_at');
};

function fn_order_status_change_date_get_orders (&$params, $fields, $sortings, &$condition, $join, $group)
{
   if (!empty($params['upd_period']) && $params['upd_period'] != 'A') {
      list($params['upd_time_from'], $params['upd_time_to']) = fn_create_periods($params, 'upd_');
      $condition .= db_quote(" AND (?:orders.status_updated_at >= ?i AND ?:orders.status_updated_at <= ?i)", $params['upd_time_from'], $params['upd_time_to']);
  } 
}

function fn_order_status_change_date_change_order_status_post ($order_id, $status_to, $status_from, $force_notification, $place_order, $order_info, $edp_data) {
   db_query('UPDATE ?:orders SET status_updated_at = ?i WHERE order_id = ?i', TIME, $order_id);
}

