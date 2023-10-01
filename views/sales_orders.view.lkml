view: sales_orders {
  # sql_table_name: `glife-data-science.glife_analysis.sales_orders` ;;

  derived_table: {
    sql:
      SELECT * FROM `glife-data-science.glife_analysis.sales_orders`
       WHERE {% condition date_range_filter%} requested_delivery_date {% endcondition %}
    ;;
  }

  filter: date_range_filter {
    type: date
    datatype: date
    # sql: {% condition usage_end_time_filter %} ${usage_end_date} {% endcondition %} ;;
    suggest_explore: products
    suggest_dimension: requested_delivery_date
  }

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
    timeframes: [date, week, week_of_year, month, year]
    datatype: date
    sql: ${TABLE}.requested_delivery_date ;;
  }
  dimension: deliveryWeekOfYear {
    type: string
    sql: CONCAT('Week',' ',${requested_delivery_week_of_year})  ;;
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
