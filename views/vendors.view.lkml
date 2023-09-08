view: vendors {
  sql_table_name: `glife-data-science.glife_analysis.vendors` ;;

  dimension: blocked {
    type: string
    sql: ${TABLE}.blocked ;;
  }
  dimension: company_address {
    type: string
    sql: ${TABLE}.company_address ;;
  }
  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }
  dimension: entity_name {
    type: string
    sql: ${TABLE}.entity_name ;;
  }
  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }
  dimension: sync_mode {
    type: string
    sql: ${TABLE}.sync_mode ;;
  }
  dimension: vendor_no {
    type: string
    sql: ${TABLE}.vendor_no ;;
  }
  measure: count {
    type: count
    drill_fields: [entity_name, group_name, company_name]
  }
}
