view: sales_order_line_items {
  sql_table_name: `glife-data-science.glife_analysis.sales_order_line_items` ;;

  dimension: customer_no {
    type: string
    sql: ${TABLE}.customer_no ;;
  }
  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }
  dimension: packed_quantity {
    type: number
    sql: ${TABLE}.packed_quantity ;;
  }
  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
    primary_key: yes
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension: sales_order_no {
    type: string
    sql: ${TABLE}.sales_order_no ;;
  }
  dimension: sync_mode {
    type: string
    sql: ${TABLE}.sync_mode ;;
  }
  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }
  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }
  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }
  measure: count {
    type: count
  }
  measure: total_packed_quantity {
    type: sum
    sql:${packed_quantity} ;;
  }

  measure: total_order {
    type: number
    sql: COUNT(${sales_order_no}) ;;
  }
  measure: total_order_dist {
    type: number
    sql: COUNT(DISTINCT ${sales_order_no}) ;;
  }

  measure: customer_has_order {
    type: count_distinct
    sql: ${customer_no} ;;
  }
  measure: total_product {
    type: number
    sql: COUNT(${product_code}) ;;
  }
  measure: distinct_product {
    type: count_distinct
    sql: ${product_code} ;;
  }
  measure: sum_total_amount {
    type: sum
    sql: ${total_amount} ;;
    description: "Total amount GST"
    # value_format_name: decimal_2
    value_format: "$#,##0"
  }
  measure: sum_total_amount_ly {
    type: sum
    sql: ${total_amount} * 0.8 ;;
    description: "Total amount GST"
    # value_format_name: decimal_2
    value_format: "$#,##0"
  }
  measure: AVG_Amount {
    type: number
    sql: 1.0 * ${sum_total_amount} / NULLIF(${total_order},0) ;;
    value_format_name: decimal_2
  }
  measure: AVG_customer {
    type: number
    sql: 1.0 * ${sum_total_amount} / NULLIF(${customer_has_order},0) ;;
    value_format_name: decimal_2
  }
  measure: AVG_total_amount{
    type: number
    sql: COUNT(${total_amount}) / NULLIF(${sum_total_amount},0) * 100;;
    value_format_name:  decimal_2
  }
  # Mockup 3
  measure: total_unit {
    type: sum
    sql: ${unit_price} ;;
    value_format_name: decimal_2
  }
  measure: AVG_unit_order {
    type: number
    sql: 1.0 * ${total_unit} / NULLIF(${total_order},0) ;;
    value_format_name: decimal_2
  }
  measure: AVG_item_order {
    type: number
    sql: 1.0 * ${total_product} / NULLIF(${total_order},0) ;;
    value_format_name: decimal_2
  }
  # report 4
  measure: total_quantity {
    type: sum
    sql:${quantity} ;;
  }
  # AVG Number of Order per Customer
  measure: AVG_Number_Order_Customer {
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${total_order} / NULLIF(count(${customer_no}),0) ;;

  }

}
