{if (!$feature && !$is_group) || ($feature.feature_type && $feature.feature_type != "ProductFeatures::GROUP"|enum)}
    <div class="control-group">
    <label class="control-label" for="elm_feature_is_required_{$id}">{__("my_reqiured_features.feature_is_required")}</label>
    <div class="controls">
        <input type="hidden" name="feature_data[is_required]" value="N" />
        <input id="elm_feature_is_required_{$id}" type="checkbox" name="feature_data[is_required]" value="Y" {if $feature.is_required == "Y"}checked="checked"{/if}/>
        <p class="muted description">{__("my_reqiured_features.tt_views_product_features_update_feature_is_required")}</p>
    </div>
    </div>
{/if}