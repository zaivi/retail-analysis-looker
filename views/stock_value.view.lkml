view: stock_value {
  parameter: fillter_date {
    type:date_time
  }
  derived_table: {
    sql:
      SELECT distinct
  p.product_code,
  so.product_name,
  p.category,
  p.sub_category,
  p.product_type,
  stock_in,
  stock_out,
  unit_price,
  (ifnull(stock_in, 0) - ifnull(stock_out, 0)) as qty,
  ((ifnull(stock_in, 0) - ifnull(stock_out, 0)) * unit_price ) as stock_value,
  avg_stock_day
FROM `glife-data-science.glife_analysis.products` p
LEFT JOIN (
  SELECT
    data.product_code,
    sum(stock_in) as stock_in
  FROM(
    SELECT
      LEFT(po_item.product_code, LENGTH(po_item.product_code) - 5) AS product_code,
      SUM(po_item.quantity) as stock_in,
    FROM `glife-data-science.glife_analysis.purchase_order_line_items` po_item
    LEFT JOIN `glife-data-science.glife_analysis.purchase_orders` po on po. purchase_order_no = po_item.purchase_order_no
    {% if fillter_date._parameter_value != 'NULL' %}
         WHERE po. posting_date <= DATE ({% parameter fillter_date %})
    {% endif %}
    GROUP BY po_item.product_code
  ) data
  GROUP BY data.product_code
)po on po.product_code = p.product_code

LEFT JOIN (
  SELECT
    data.product_code,
    data.stock_out,
    data.unit_price,
    data.product_name,
    sum(avg_stock_day) as avg_stock_day
  FROM (
    SELECT
      product_code,
      SUM(so_item.quantity) as stock_out,
      --avg(so_item.unit_price) as unit_price,
      so_item.unit_price as unit_price,
      so_item. product_name
    FROM `glife-data-science.glife_analysis.sales_order_line_items` so_item
    LEFT JOIN `glife-data-science.glife_analysis.sales_orders` so on so.sales_order_no = so_item.sales_order_no
    {% if fillter_date._parameter_value != 'NULL' %}
         WHERE so.requested_delivery_date   <= DATE ({% parameter fillter_date %})
    {% endif %}
    GROUP BY so_item.product_code, so_item. product_name  ,so_item.unit_price
  ) data
  LEFT JOIN (
    SELECT
      product_code,
      SUM(ifnull(so_item.quantity, 0 ) * unit_price) / 30 as avg_stock_day,
    FROM `glife-data-science.glife_analysis.sales_order_line_items` so_item
    LEFT JOIN `glife-data-science.glife_analysis.sales_orders` so on so.sales_order_no = so_item.sales_order_no
    {% if fillter_date._parameter_value != 'NULL' %}
         WHERE  so.requested_delivery_date >= DATE_ADD(Date ({% parameter fillter_date %}), INTERVAL -30 DAY) and so.requested_delivery_date  <= DATE ({% parameter fillter_date %})
    {% else %}
        WHERE  so.requested_delivery_date >= DATE_ADD(CURRENT_DATE(), INTERVAL -30 DAY)  and so.requested_delivery_date  <= CURRENT_DATE()
    {% endif %}
    GROUP BY so_item.product_code, so_item. product_name  ,so_item.unit_price
  )avg on avg.product_code = data.product_code
  GROUP BY  data.product_code,
    data.stock_out,
    data.unit_price,
    data.product_name
)so on so.product_code = p.product_code

 ;;
  }
  dimension: product_code {
    type: string
    sql:${TABLE}.product_code;;
  }
  dimension: product_type {
    type: string
    sql:${TABLE}.product_type;;
  }
  dimension: product_name {
    type: string
    sql:${TABLE}.product_name;;
  }
  dimension: sub_category {
    type: string
    sql:${TABLE}.sub_category;;
  }
  dimension: category {
    type: string
    sql:${TABLE}.category;;
  }
  dimension:  qty {
    type:number
    sql:${TABLE}.qty;;
  }
  dimension:  stock_in {
    type:number
    sql:${TABLE}.stock_in;;
  }
  dimension:  stock_out {
    type:number
    sql:${TABLE}.stock_out;;
  }
  dimension:  unit_price {
    type:number
    sql:${TABLE}.unit_price;;
  }
  dimension:  avg_stock_day {
    type:number
    sql:${TABLE}.avg_stock_day;;
  }
  measure:  balance_vaule {
    type:  sum
    sql: ${qty} * ${unit_price};;
  }
  measure: count {
    type: number
    sql: count(${product_code} );;
  }
  measure:  stock_cover_day {
    type:  sum
    sql: ${qty} * ${unit_price}/${avg_stock_day};;
  }
}
