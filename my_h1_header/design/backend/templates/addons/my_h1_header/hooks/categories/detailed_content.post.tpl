{if !$runtime.company_id && "MULTIVENDOR"|fn_allowed_for}
    {include 
        file="addons/my_h1_header/common/seo_fields.tpl" 
        object_data=$category_data 
        object_name="category_data" 
        object_id=$category_data.category_id 
        object_type="c"
    }
{/if}