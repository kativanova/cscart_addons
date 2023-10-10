<div class="ty-orders-detail">

    {if $order_info}

        {capture name="order_actions"}
            {if $view_only != "Y"}
                <div class="ty-orders__actions">
                    {hook name="orders:details_tools"}
                        {$print_order = __("print_invoice")}
                        {if $status_settings.appearance_type == "C" && $order_info.doc_ids[$status_settings.appearance_type]}
                            {$print_order = __("print_credit_memo")}
                        {elseif $status_settings.appearance_type == "O"}
                            {$print_order = __("print_order_details")}
                        {/if}

                        {include file="buttons/button.tpl" but_role="text" but_text=$print_order but_href="orders.print_invoice?order_id=`$order_info.order_id`" but_meta="cm-new-window ty-btn__text" but_icon="ty-icon-print orders-print__icon"}
                    {/hook}

                    <div class="ty-orders__actions-right">
                        {if $view_only != "Y"}
                            {hook name="orders:details_bullets"}
                            {/hook}
                        {/if}

                        {include file="buttons/button.tpl" but_meta="ty-btn__text" but_role="text" but_text=__("re_order") but_href="orders.reorder?order_id=`$order_info.order_id`" but_icon="ty-orders__actions-icon ty-icon-cw"}
                    </div>

                </div>
            {/if}
        {/capture}

        {capture name="tabsbox"}

        <div id="content_general" class="{if $selected_section && $selected_section != "general"}hidden{/if}">

            {if $without_customer != "Y"}
            {* Customer info *}
                <div class="orders-customer">
                {include file="views/profiles/components/profiles_info.tpl" user_data=$order_info location="I"}
                </div>
            {* /Customer info *}
            {/if}


        {capture name="group"}

            {include file="common/subheader.tpl" title=__("products_information")}

            <table class="ty-orders-detail__table ty-table">
                {hook name="orders:items_list_header"}
                    <thead>
                        <tr>
                            <th class="ty-orders-detail__table-product">{__("product")}</th>
                            <th class="ty-orders-detail__table-quantity">{__("quantity")}</th>
                            {if $order_info.use_discount}
                                <th class="ty-orders-detail__table-discount">{__("discount")}</th>
                            {/if}
                            {if $order_info.taxes && $settings.Checkout.tax_calculation != "subtotal"}
                                <th class="ty-orders-detail__table-tax">{__("tax")}</th>
                            {/if}
                        </tr>
                    </thead>
                {/hook}
                {foreach from=$order_info.products item="product" key="key"}
                    {hook name="orders:items_list_row"}
                        {if !$product.extra.parent}
                            <tr class="ty-valign-top">
                                <td>
                                    <div class="clearfix">
                                        <div class="ty-float-left ty-orders-detail__table-image">
                                            {hook name="orders:product_icon"}
                                                {if $product.is_accessible}<a href="{"products.view?product_id=`$product.product_id`"|fn_url}">{/if}
                                                    {include file="common/image.tpl" obj_id=$key images=$product.main_pair image_width=$settings.Thumbnails.product_cart_thumbnail_width image_height=$settings.Thumbnails.product_cart_thumbnail_height}
                                                {if $product.is_accessible}</a>{/if}
                                            {/hook}
                                        </div>

                                        <div class="ty-overflow-hidden ty-orders-detail__table-description-wrapper">
                                            <div class="ty-ml-s ty-orders-detail__table-description">
                                                {if $product.is_accessible}<a href="{"products.view?product_id=`$product.product_id`"|fn_url}">{/if}
                                                    {$product.product nofilter}
                                                {if $product.is_accessible}</a>{/if}
                                                {if $product.extra.is_edp == "Y"}
                                                    <div class="ty-right">
                                                        <a href="{"orders.order_downloads?order_id=`$order_info.order_id`"|fn_url}">[{__("download")}]</a>
                                                    </div>
                                                {/if}
                                                {if $product.product_code}
                                                    <div class="ty-orders-detail__table-code">{__("sku")}:&nbsp;{$product.product_code}</div>
                                                {/if}
                                                {hook name="orders:product_info"}
                                                    {if $product.product_options}{include file="common/options_info.tpl" product_options=$product.product_options inline_option=true}{/if}
                                                {/hook}
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="ty-center">&nbsp;{$product.amount}</td>
                            </tr>
                        {/if}
                    {/hook}
                {/foreach}

                {hook name="orders:extra_list"}
                    {assign var="colsp" value=5}
                    {if $order_info.use_discount}{assign var="colsp" value=$colsp+1}{/if}
                    {if $order_info.taxes && $settings.Checkout.tax_calculation != "subtotal"}{assign var="colsp" value=$colsp+1}{/if}
                {/hook}

            </table>

            {*Customer notes*}
                {if $order_info.notes}
                <div class="ty-orders-notes">
                    {include file="common/subheader.tpl" title=__("customer_notes")}
                    <div class="ty-orders-notes__body">
                        <span class="ty-caret"><span class="ty-caret-outer"></span><span class="ty-caret-inner"></span></span>
                        {$order_info.notes|nl2br nofilter}
                    </div>
                </div>
                {/if}
            {*/Customer notes*}

        {/capture}
        <div class="ty-orders-detail__products orders-product">
            {include file="common/group.tpl"  content=$smarty.capture.group}
        </div>
        </div><!-- main order info -->

        {hook name="orders:tabs"}
        {/hook}

        {/capture}
        {include file="common/tabsbox.tpl" top_order_actions=$smarty.capture.order_actions content=$smarty.capture.tabsbox active_tab=$smarty.request.selected_section}

    {/if}
</div>

{hook name="orders:details"}
{/hook}

{capture name="mainbox_title"}
    {__("order")}&nbsp;<bdi>#{$order_info.order_id}</bdi>
    <em class="ty-date">({$order_info.timestamp|date_format:"`$settings.Appearance.date_format`, `$settings.Appearance.time_format`"})</em>
    <em class="ty-status">{__("status")}: {include file="common/status.tpl" status=$order_info.status display="view" name="update_order[status]"}</em>
{/capture}
