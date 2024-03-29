<div id="product_features_{$block.block_id}">
<div class="ty-feature">
    {if $variant_data.image_pair}
    <div class="ty-feature__image">
        {include file="common/image.tpl" images=$variant_data.image_pair}
    </div>
    {/if}
    <div class="ty-feature__description ty-wysiwyg-content">
        {if $variant_data.url}
        <p><a href="{$variant_data.url}">{$variant_data.url}</a></p>
        {/if}
        {$variant_data.description nofilter}
    </div>
</div>

{if $products}
{assign var="layouts" value=""|fn_get_products_views:false:0}
{if $layouts.$selected_layout.template}
    {include file="`$layouts.$selected_layout.template`" columns=$settings.Appearance.columns_in_products_list}
{/if}
{else}
    <p class="ty-no-items">{__("text_no_products")}</p>
{/if}
<!--product_features_{$block.block_id}--></div>
<div class="ty-additional-description">
    <h1 class="ty-h1-header">{$variant_data.h1_header}</h1>
    <div class="ty-additional-description-text">
        {$variant_data.seo_description nofilter}
    </div>
</div>
{capture name="mainbox_title"}{$variant_data.variant nofilter}{/capture}