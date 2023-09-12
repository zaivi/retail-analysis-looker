view: products {
  sql_table_name: `glife-data-science.glife_analysis.products` ;;

  dimension: base_unit {
    type: string
    sql: ${TABLE}.base_unit ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: chinese_name {
    type: string
    sql: ${TABLE}.Chinese_name ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
    primary_key: yes
  }
  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: sub_category {
    type: string
    sql: ${TABLE}.sub_category ;;
  }
  dimension: sync_mode {
    type: string
    sql: ${TABLE}.sync_mode ;;
  }
  dimension: uom {
    type: string
    sql: ${TABLE}.uom ;;
  }
  measure: count {
    type: count
    drill_fields: [chinese_name, name]
  }
}
