{if $auth.user_type === "UserTypes::ADMIN"|enum}
<div class="ty-control-group product-list-field">
    <label class="ty-control-group__label">{__("my_product_field.custom_link")}:</label>
    <span id="custom_link_{$obj_prefix}{$obj_id}" class="ty-pricing-option ty-control-group__item">
        <a href="{$product.custom_link}">{$product.custom_link}</a>
    </span>
</div>
{/if}