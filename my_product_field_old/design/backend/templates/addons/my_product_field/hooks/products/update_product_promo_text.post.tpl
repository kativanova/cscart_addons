{component name="configurable_page.field" entity="products" tab="detailed" section="extra" field="custom_link"}
<div class="control-group {$no_hide_input_if_shared_product}">
    <label for="product_custom_link" class="control-label">{__("my_product_field.custom_link")}</label>
    <div class="controls">
        <input class="input-large" form="form" type="text" name="product_data[custom_link]" id="product_custom_link"
            size="55" value="{$product_data.custom_link}" />
    </div>
</div>
{/component}