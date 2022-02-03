{if $show_product_amount && $product.is_edp != "Y" && $settings.General.inventory_tracking !== "YesNo::NO"|enum}
    <div class="cm-reload-{$obj_prefix}{$obj_id} stock-wrap" id="product_amount_update_{$obj_prefix}{$obj_id}">
        <input type="hidden" name="appearance[show_product_amount]" value="{$show_product_amount}" />
        {if !$product.hide_stock_info}
            {if $show_amount_label}
                <label class="ty-control-group__label">{__("availability")}:</label>
            {/if}
        {*  
            Если количество продаж товара за последнюю неделю было 1 или менее и товар есть в наличии
              ИЛИ 
            Если количество товара в наличии равно количеству товаров, проданному за последнюю неделю, 
            Отображается Достаточно жёлтым цветом. 
        *}
            {if ($weekly_sales_amount < 1 && $product.amount > 0)
                || ($product.amount == $weekly_sales_amount )}
                <span class="ty-qty-enough-stock ty-control-group__item">{__("enough")}</span>
        {* 
            Если количество товара в наличии больше, чем количество этого товара, проданного за последнюю неделю, 
            Отображается Много зелёным цветом. 
        *}
            {elseif $product.amount > $weekly_sales_amount}
                <span class="ty-qty-a_lot-stock ty-control-group__item">{__("a_lot")}</span>
        {* Для всех остальных случаев отображается Мало красным цветом, в том числе, когда товара нет на складе. *}
            {else}
                <span class="ty-qty-a_few-stock ty-control-group__item">{__("a_few")}</span>    
            {/if}
        {/if}
    <!--product_amount_update_{$obj_prefix}{$obj_id}-->
    </div>
{/if}