{if $runtime.company_id && "ULTIMATE"|fn_allowed_for || "MULTIVENDOR"|fn_allowed_for}
    {include 
        file="addons/my_h1_header/common/seo_fields.tpl" 
        object_data=$company_data 
        object_name="company_data" 
        object_id=$id
    }
{/if}