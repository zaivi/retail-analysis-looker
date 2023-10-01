view: customer_repeat_purchase {
  derived_table: {
    sql:
      SELECT
         case when data.from_to = 1 then 1 else 0 end as from_1_to_3,
        case when data.from_to = 2 then 1 else 0 end as from_4_to_8,
        case when data.from_to = 3 then 1 else 0 end as over_8,
        customer_no
      FROM (

      select
       1 as from_to,
        c.customer_no
      from `glife-data-science.glife_analysis.customers`  c
      left join `glife-data-science.glife_analysis.sales_order_line_items` o on o.customer_no = c.customer_no
      GROUP BY c.customer_no
      HAVING COUNT(o.customer_no) BETWEEN 1 AND 3

      UNION  ALL

      select
      2 as from_to,
        c.customer_no
      from `glife-data-science.glife_analysis.customers`  c
      left join `glife-data-science.glife_analysis.sales_order_line_items` o on o.customer_no = c.customer_no
      GROUP BY c.customer_no
      HAVING COUNT(o.customer_no) BETWEEN 4 AND 8

      UNION  ALL

      select
       1 as from_to,
        c.customer_no
      from `glife-data-science.glife_analysis.customers`  c
      left join `glife-data-science.glife_analysis.sales_order_line_items` o on o.customer_no = c.customer_no
      GROUP BY c.customer_no
      HAVING COUNT(o.customer_no) > 8
      ) data

    ;;
  }
  dimension: customer_no {
    type: string
    sql:${TABLE}.customer_no;;
    primary_key: yes
  }
  dimension: from_1_to_3 {
    type: number
    sql:${TABLE}.from_1_to_3;;
  }
  dimension: from_4_to_8 {
    type: number
    sql:${TABLE}.from_4_to_8;;
  }
  dimension: over_8 {
    type: number
    sql:${TABLE}.over_8;;
  }
  measure: count {
    type: number
    sql: count(${customer_no} );;
  }
  measure: sum_from_1_to_3 {
    type: sum
     sql: ${from_1_to_3} ;;
  }
  measure: sum_from_4_to_8 {
    type: sum
    sql: ${from_4_to_8} ;;
  }
  measure: sum_over_8{
    type: sum
    sql: ${over_8} ;;
  }
}
