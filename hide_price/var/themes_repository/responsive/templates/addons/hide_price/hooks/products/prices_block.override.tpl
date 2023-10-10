{hook name="products:prices_block"}
{if $product.is_edp === "YesNo::NO"|enum}
{if $product.price|floatval || $product.zero_price_action == "P" || ($hide_add_to_cart_button == "Y" && $product.zero_price_action == "A")}
    <span class="ty-price{if !$product.price|floatval && !$product.zero_price_action} hidden{/if}" id="line_discounted_price_{$obj_prefix}{$obj_id}">{include file="common/price.tpl" value=$product.price span_id="discounted_price_`$obj_prefix``$obj_id`" class="ty-price-num" live_editor_name="product:price:{$product.product_id}" live_editor_phrase=$product.base_price}</span>
{elseif $product.zero_price_action == "A" && $show_add_to_cart}
    {assign var="base_currency" value=$currencies[$smarty.const.CART_PRIMARY_CURRENCY]}
    <span class="ty-price-curency"><span class="ty-price-curency__title">{__("enter_your_price")}:</span>
    <div class="ty-price-curency-input">
        <input 
            type="text"
            name="product_data[{$obj_id}][price]"
            class="ty-price-curency__input cm-numeric"
            data-a-sign="{$base_currency.symbol nofilter}" 
            data-a-dec="{if $base_currency.decimal_separator}{$base_currency.decimal_separator nofilter}{else}.{/if}" 
            data-a-sep="{if $base_currency.thousands_separator}{$base_currency.thousands_separator nofilter}{else},{/if}"
            data-p-sign="{if $base_currency.after === "YesNo::YES"|enum}s{else}p{/if}"
            data-m-dec="{$base_currency.decimals}"
            size="3"
            value=""
        />
    </div>
    </span>

{elseif $product.zero_price_action == "R"}
    <span class="ty-no-price">{__("contact_us_for_price")}</span>
    {assign var="show_qty" value=false}
{/if}
{else}
    <p></p>
{/if}
{/hook}