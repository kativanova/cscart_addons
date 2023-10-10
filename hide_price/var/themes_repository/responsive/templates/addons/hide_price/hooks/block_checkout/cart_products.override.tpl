{hook name="block_checkout:cart_products"}
{if !$cart.products.$key.extra.parent}
    <li class="ty-order-products__item">
        <bdi><a class="litecheckout__order-products-p" href="{"products.view?product_id=`$product.product_id`"|fn_url}">{$product.product nofilter}</a></bdi>
        {if !$product.exclude_from_calculate}
            {include file="buttons/button.tpl" but_href="checkout.delete?cart_id=`$key`&redirect_mode=`$runtime.mode`" but_meta="ty-order-products__item-delete delete" but_target_id="cart_status*" but_role="delete" but_name="delete_cart_item"}
        {/if}
        {hook name="products:product_additional_info"}
        {/hook}
        {include file="common/options_info.tpl" product_options=$product.product_options no_block=true}
        {hook name="block_checkout:product_extra"}{/hook}
    </li>
{/if}
{/hook}