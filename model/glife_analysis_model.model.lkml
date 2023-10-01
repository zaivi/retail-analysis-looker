connection: "@{glife_analysis_bq_cnn}"

include: "/views/*.view.lkml"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

explore: sales_order_line_items {
  join: sales_orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${sales_order_line_items.sales_order_no} = ${sales_orders.sales_order_no} ;;
  }
}

explore: products {
  join: sales_order_line_items {
    type: left_outer
    relationship: one_to_many
    sql_on: ${products.product_code} = ${sales_order_line_items.product_code} ;;
  }

  join: sales_orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${sales_order_line_items.sales_order_no} = ${sales_orders.sales_order_no} ;;
  }

  join: customers {
    type: left_outer
    relationship: one_to_one
    sql_on: ${sales_orders.customer_no} = ${customers.customer_no} ;;
  }
}
explore:stock_value { }
explore: stock_out_stock_in {}

explore: customers {
  join:  sales_orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_orders.customer_no} = ${customers.customer_no} ;;
  }
  join: sales_order_line_items {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_order_line_items.sales_order_no} = ${sales_orders.sales_order_no} ;;
  }
  join: customer_repeat_purchase {
    type: left_outer
    relationship: one_to_many
    sql_on: ${customer_repeat_purchase.customer_no} = ${customers.customer_no} ;;
  }
}
