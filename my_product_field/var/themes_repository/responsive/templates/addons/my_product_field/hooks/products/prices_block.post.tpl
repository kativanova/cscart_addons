<div class="ty-control-group product-list-field">
    <label class="ty-control-group__label">{__("my_product_field.pricing_option")}:</label>
    <span id="pricing_option_{$obj_prefix}{$obj_id}" class="ty-pricing-option ty-control-group__item">
        {if $product.pricing_option == 'P'}{__("my_product_field.per_project")}
        {elseif $product.pricing_option == 'H'}{__("my_product_field.per_hour")}
        {/if}
    </span>
</div>