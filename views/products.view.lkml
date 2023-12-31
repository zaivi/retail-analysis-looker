view: products {
  # sql_table_name: `glife-data-science.glife_analysis.products` ;;

  derived_table: {
    sql:
      SELECT * FROM `glife-data-science.glife_analysis.products_final`
      WHERE {% condition sub_category_filter%} sub_category {% endcondition %}
      AND {% condition category_filter%} category {% endcondition %}
      AND {% condition product_name_filter%} name {% endcondition %}
      AND {% condition product_type_filter%} product_type {% endcondition %}
    ;;
  }

  # drill_fields: [product_name_link]

  filter: sub_category_filter {
    type: string
    # sql: {% condition usage_end_time_filter %} ${usage_end_date} {% endcondition %} ;;
    suggest_explore: products
    suggest_dimension: sub_category
  }

  filter: category_filter {
    type: string
    # sql: {% condition usage_end_time_filter %} ${usage_end_date} {% endcondition %} ;;
    suggest_explore: products
    suggest_dimension: category
  }

  filter: product_name_filter {
    type: string
    # sql: {% condition usage_end_time_filter %} ${usage_end_date} {% endcondition %} ;;
    suggest_explore: products
    suggest_dimension: name
  }

  filter: product_type_filter {
    type: string
    # sql: {% condition usage_end_time_filter %} ${usage_end_date} {% endcondition %} ;;
    suggest_explore: products
    suggest_dimension: product_type
  }

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
  dimension: product_name_link {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Filter by Product Name"
      url: "/dashboards/13?Category={{ _filters['products.category'] }}&Date+Range={{ _filters['sales_orders.date_range_filter'] }}&Sub+Category={{ _filters['products.sub_category_filter'] }}&Product+Type={{ _filters['products.product_type'] }}&Product+Name={{ value }}"
    }
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
