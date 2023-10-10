{component name="configurable_page.field" entity="products" tab="detailed" section="availability" field="product_google_name"}
<div class="control-group">
    <label class="control-label" for="product_product_google_name">{__("my_product_field.product_google_name")}:</label>
    <div class="controls">
            <input class="input-large" form="form" type="text" name="product_data[product_google_name]" id="product_product_google_name" size="55" value="{$product_data.product_google_name}" />
            {include file="buttons/update_for_all.tpl"
                display=$show_update_for_all
                object_id="product"
                name="update_all_vendors[product_google_name]"
                component="products.product_google_name"
            }
    </div>
</div>
{/component}