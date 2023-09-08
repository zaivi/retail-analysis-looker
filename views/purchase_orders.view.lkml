view: purchase_orders {
  sql_table_name: `glife-data-science.glife_analysis.purchase_orders` ;;

  dimension: payment_status {
    type: string
    sql: ${TABLE}.payment_status ;;
  }
  dimension: payment_term {
    type: string
    sql: ${TABLE}.payment_term ;;
  }
  dimension_group: posting {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.posting_date ;;
  }
  dimension: purchase_order_no {
    type: string
    sql: ${TABLE}.purchase_order_no ;;
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
  dimension: vendor_no {
    type: string
    sql: ${TABLE}.vendor_no ;;
  }
  measure: count {
    type: count
  }
}
