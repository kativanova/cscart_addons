{component name="configurable_page.field" entity="products" tab="detailed" section="availability" field="is_rentable"}
<div class="control-group">
    <label class="control-label" for="product_is_rentable">{__("my_product_field.is_rentable")}:</label>
    <div class="controls">
        <label class="checkbox">
            <input type="hidden" name="product_data[is_rentable]" value="{"YesNo::NO"|enum}" />
            <input type="checkbox" name="product_data[is_rentable]" id="elm_product_is_rentable" value="{"YesNo::YES"|enum}"
                {if $product_data.is_rentable === "YesNo::YES"|enum} checked="checked" {/if}
            />
        </label>
    </div>
</div>
{/component}