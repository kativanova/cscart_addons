       {if $product.is_rentable=="YesNo::YES"|enum}
           <label class="ty-control-group__label">{__("my_product_field.lessor")}:</label>
       {else}
           <label class="ty-control-group__label">{__("vendor")}:</label>
       {/if}
       <span class="ty-control-group__item ty-company-name"><a href="{"companies.products?company_id=`$company_id`"|fn_url}">{if $company_name}{$company_name}{else}{$company_id|fn_get_company_name}{/if}</a></span>