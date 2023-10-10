{if $runtime.company_id && "ULTIMATE"|fn_allowed_for || "MULTIVENDOR"|fn_allowed_for}
    {include 
        file="addons/my_h1_header/common/seo_fields.tpl" 
        object_data=$page_data 
        object_name="page_data" 
        object_id=$page_data.page_id 
        object_type="a"
    }
{/if}