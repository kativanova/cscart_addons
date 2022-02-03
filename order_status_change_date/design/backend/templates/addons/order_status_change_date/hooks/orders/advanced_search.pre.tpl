<div class="group form-horizontal">
    <div class="control-group">
        <label class="control-label">{__("order_status_change_date.order_update_period")}</label>
        <div class="controls">
            {include file="common/period_selector.tpl" period=$search.upd_period prefix='upd_' form_name="orders_search_form"}
        </div>
    </div>
</div>