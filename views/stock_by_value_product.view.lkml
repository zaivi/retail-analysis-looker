view: stock_by_value_product {
  derived_table: {
    sql: SELECT
      p.product_code
    FROM `glife-data-science.glife_analysis.products` p;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }
  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: sub_cayegory {
    type: string
    sql: ${TABLE}.sub_cayegory ;;
  }
  dimension_group: time_period {
    type: time
    timeframes: [date, week, month, year]
    datatype: date
    sql: ${TABLE}.time_period ;;
  }
  dimension: stock_vaule {
    type: number
    sql: ${TABLE}.stock_vaule ;;
  }
  measure: count {
    type: count
    sql: ${product_code} ;;
  }
  measure: sum {
    type: sum
    sql: ${stock_vaule} ;;
  }
}
