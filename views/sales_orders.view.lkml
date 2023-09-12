view: sales_orders {
  sql_table_name: `glife-data-science.glife_analysis.sales_orders` ;;

  dimension: customer_no {
    type: string
    sql: ${TABLE}.customer_no ;;
  }
  dimension: payment_term {
    type: string
    sql: ${TABLE}.payment_term ;;
  }
  dimension_group: requested_delivery {
    type: time
    timeframes: [date, week, month, year]
    datatype: date
    sql: ${TABLE}.requested_delivery_date ;;
  }
  dimension: sales_order_no {
    type: string
    sql: ${TABLE}.sales_order_no ;;
    primary_key: yes
  }
  dimension: sales_order_type {
    type: string
    sql: ${TABLE}.sales_order_type ;;
  }
  dimension: sync_mode {
    type: string
    sql: ${TABLE}.sync_mode ;;
  }
  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }
  dimension: total_gst {
    type: number
    sql: ${TABLE}.total_gst ;;
  }
  dimension: total_include_gst {
    type: number
    sql: ${TABLE}.total_include_gst ;;
  }
  measure: count {
    type: count
  }
}
