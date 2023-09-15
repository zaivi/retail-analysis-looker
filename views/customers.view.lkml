view: customers {
  sql_table_name: `glife-data-science.glife_analysis.customers` ;;

  dimension: billing_address {
    type: string
    sql: ${TABLE}.billing_address ;;
  }
  dimension: blocked {
    type: string
    sql: ${TABLE}.blocked ;;
  }
  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }
  dimension: customer_no {
    type: string
    sql: ${TABLE}.customer_no ;;
    primary_key: yes
  }
  dimension: delivery_address {
    type: string
    sql: ${TABLE}.delivery_address ;;
  }
  dimension: entity_name {
    type: string
    sql: ${TABLE}.entity_name ;;
  }
  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }
  dimension: packing_warehouse {
    type: string
    sql: ${TABLE}.packing_warehouse ;;
  }
  dimension: payment_term {
    type: string
    sql: ${TABLE}.payment_term ;;
  }
  dimension: sync_mod {
    type: string
    sql: ${TABLE}.sync_mod ;;
  }
  measure: count {
    type: count
    drill_fields: [entity_name, group_name, company_name]
  }
}
