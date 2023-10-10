{hook name="checkout:dropdown_title"}
{$additional_class = ($smarty.session.cart.amount) ? "filled" : "empty"}
{include_ext file="common/icon.tpl"
    class="ty-icon-moon-commerce ty-minicart__icon `$additional_class`"
}
<span class="ty-minicart-title{if !$smarty.session.cart.amount} empty-cart{/if} ty-hand">
    <span class="ty-block ty-minicart-title__header ty-uppercase">{__("my_cart")}</span>
    <span class="ty-block">
    {if $smarty.session.cart.amount}
        {$smarty.session.cart.amount}&nbsp;{__("items")}
    {else}
        {__("cart_is_empty")}
    {/if}
    </span>
</span>
{/hook}