    
      {*anikolaychenko*}
{if !$oi.extra.parent}

    {* if $order_product_icons *}

    {if $addons.confirmation_message.status == "A"}
          {if  $addons.confirmation_message.img11 == "Y"}    
                {foreach $order_info.product_groups as $group}
                    {foreach $group.products as $product}
                        {if $product.product_id == $oi.product_id}
                            <div align="left">
                                {include file="addons/confirmation_message/image.tpl" images=$product.main_pair image_width=$settings.Thumbnails.product_lists_thumbnail_width}
                            <div>
                        {/if}
                    {/foreach}                        
                {/foreach}
          {/if}

          {if  $addons.confirmation_message.short_description1 == "Y"}
          {if $oi.short_description}<br>{$oi.short_description|unescape nofilter}{/if}
          {/if}

          {if  $addons.confirmation_message.full_description1 == "Y"}
          {if $oi.full_description}<br>{$oi.full_description|unescape nofilter}{/if}
          {/if}
    {/if}

    {* /if *}

{/if}
      {*/anikolaychenko*}
