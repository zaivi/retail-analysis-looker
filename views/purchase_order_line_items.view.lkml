view: purchase_order_line_items {
  sql_table_name: `glife-data-science.glife_analysis.purchase_order_line_items` ;;

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }
  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: purchase_order_no {
    type: string
    sql: ${TABLE}.purchase_order_no ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
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
