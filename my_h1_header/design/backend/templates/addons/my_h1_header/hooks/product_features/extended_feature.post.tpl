{if $feature_type == "ProductFeatures::EXTENDED"|enum && ($runtime.company_id && "ULTIMATE"|fn_allowed_for || "MULTIVENDOR"|fn_allowed_for)}
    {include 
        file="addons/my_h1_header/common/seo_fields.tpl" 
        object_data=$var 
        object_name="feature_data[variants][`$num`]" 
        hide_title=true 
        object_id=$var.variant_id 
        object_type="e"
    }
{/if}