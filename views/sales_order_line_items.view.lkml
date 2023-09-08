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
    drill_fields: [product_name]
  }
}
