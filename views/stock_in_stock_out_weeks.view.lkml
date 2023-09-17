view: stock_out_stock_in {
  parameter: fillter_date {
    type:date
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
FROM `glife-data-science.glife_analysis.products` p
LEFT JOIN (
  SELECT
    data.product_code,
    sum(stock_in) as stock_in
  FROM(
    SELECT
      LEFT(po_item.product_code, LENGTH(po_item.product_code) - 5) AS product_code,
      po_item.product_code as code ,
      SUM(po_item.quantity) as stock_in,
    FROM `glife-data-science.glife_analysis.purchase_order_line_items` po_item
    LEFT JOIN `glife-data-science.glife_analysis.purchase_orders` po on po. purchase_order_no = po_item.purchase_order_no
    {% if fillter_date._parameter_value != 'NULL' %}
         WHERE po. posting_date <= DATE_ADD(Date ({% parameter fillter_date %}), INTERVAL -13 WEEK)
    {% endif %}
    -- WHERE  po. posting_date <= '2022-01-08'
    GROUP BY po_item.product_code
  ) data
  GROUP BY data.product_code
)po on po.product_code = p.product_code
LEFT JOIN (
  SELECT
    product_code,
    SUM(so_item.quantity) as stock_out,
    --avg(so_item.unit_price) as unit_price,
    so_item.unit_price as unit_price,
    so_item. product_name
    --sales_order_line_items.quantity
  FROM `glife-data-science.glife_analysis.sales_order_line_items` so_item
  LEFT JOIN `glife-data-science.glife_analysis.sales_orders` so on so.sales_order_no = so_item.sales_order_no
  {% if fillter_date._parameter_value != 'NULL' %}
         WHERE so.requested_delivery_date  <= DATE_ADD(Date ({% parameter fillter_date %}), INTERVAL -13 WEEK)
    {% endif %}
  --- WHERE  so.requested_delivery_date  <='2022-01-08' and so_item.product_code ='F007'
  GROUP BY so_item.product_code, so_item. product_name  ,so_item.unit_price
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
  measure:  balance_vaule {
    type:  sum
    sql: ${qty} * ${unit_price};;
  }
  measure: count {
    type: number
    sql: count(${product_code} );;
  }
}
