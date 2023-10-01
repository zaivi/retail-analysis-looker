view: top_5_sub_category {
  derived_table: {
    sql:
      -- raw sql results do not include filled-in values for 'sales_orders.requested_delivery_month'

      -- raw sql results do not include filled-in values for 'sales_orders.requested_delivery_month'
      with tmp as (
      SELECT
          -- products.product_code as product_code,
          products.sub_category  AS sub_category,
          (DATE_TRUNC(requested_delivery_date, MONTH)) requested_delivery_month,
          COALESCE(SUM(sales_order_line_items.total_amount ), 0) AS total_amount
      FROM `glife-data-science.glife_analysis.products`  AS products
      LEFT JOIN `glife-data-science.glife_analysis.sales_order_line_items`  AS sales_order_line_items ON products.product_code = sales_order_line_items.product_code
      LEFT JOIN `glife-data-science.glife_analysis.sales_orders`  AS sales_orders ON sales_order_line_items.sales_order_no = sales_orders.sales_order_no
      WHERE {% condition date_range_filter%} requested_delivery_date {% endcondition %}
        AND {% condition sub_category_filter%} products.sub_category {% endcondition %}
      GROUP BY
          1,
          2
      ), tmp_2 as (
      SELECT
          sub_category,
          requested_delivery_month,
          total_amount,
          case
          when ROW_NUMBER() over (PARTITION BY requested_delivery_month ORDER BY total_amount DESC) <= 5
              then sub_category
              else "Others" end AS _rank
      FROM tmp
      )
      SELECT
          -- sub_category,
          _rank sub_category,
          requested_delivery_month,
          SUM(total_amount) total_amount,
      FROM
          tmp_2
      GROUP BY
          1,2
    ;;
  }

  filter: sub_category_filter {
    type: string
    # sql: {% condition usage_end_time_filter %} ${usage_end_date} {% endcondition %} ;;
    suggest_explore: products
    suggest_dimension: sub_category
  }

  filter: date_range_filter {
    type: date
    datatype: date
    # sql: {% condition usage_end_time_filter %} ${usage_end_date} {% endcondition %} ;;
    suggest_explore: products
    suggest_dimension: requested_delivery_month
  }

  filter: category_filter {
    type: string
    # sql: {% condition usage_end_time_filter %} ${usage_end_date} {% endcondition %} ;;
    suggest_explore: products
    suggest_dimension: sub_category
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.sub_category ;;
    primary_key: yes
    link: {
      label: "Filter by Sub Category"
      url: "/dashboards/13?Category={{ _filters['top_5_sub_category.category_filter'] }}&Date+Range={{ _filters['top_5_sub_category.date_range_filter'] }}&Sub+Category={{ value }}&Product+Type={{ _filters['products.product_type'] }}&Product+Name={{ _filters['products.name'] }}"
    }
  }
  dimension_group: requested_delivery {
    type: time
    # datatype: date

    sql: ${TABLE}.requested_delivery_month ;;
  }
  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }
  # measure: sum_total_amount {
  #   type: sum
  #   sql: ${total_amount} ;;
  #   description: "Total amount GST"
  #   # value_format_name: decimal_2
  #   value_format: "$#,##0"
  # }
}
