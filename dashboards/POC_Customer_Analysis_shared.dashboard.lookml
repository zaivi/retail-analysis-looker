---
- dashboard: poc__customer_analysis
  title: POC - Customer Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: SR5H5ltUq2TJChrQbu7ACz
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border-bottom: solid 1px #000;\">\n \n<nav style=\"font-size:\
      \ 18px; padding: 5px 10px 0 10px; height: 60px\" >\n\n\n<a style=\"padding:\
      \ 5px 15px; border-bottom: solid 1px #000;color: #079c98; float: left; line-height:\
      \ 40px; \" href=\"/dashboards/49\" >  Sales Analysis </a>\n\n<a style=\"padding:\
      \ 5px 15px; float: left; line-height: 40px; border-radius: 5px 5px 0 0; font-weight:\
      \ bold; color:#fff; background-color: #079c98\" href=\"#\" class=\"test\"> Customer\
      \ Analysis </a>\n\n\n<a style=\"padding: 5px 15px; border-bottom: solid 1px\
      \ #000; color: #079c98; float: left; line-height: 40px;\" href=\"/dashboards/51\"\
      \ > Delivery Analysis </a>\n\n\n<a style=\"padding: 5px 15px; border-bottom:\
      \ solid 1px #000;color: #079c98; float: left; line-height: 40px;\" href=\"/dashboards/52\"\
      \ > Inventory Analysis </a>\n\n<a style=\"padding: 5px 15px; border-bottom:\
      \ solid 1px #000;color: #079c98; float: left; line-height: 40px;\" href=\"/dashboards/53\"\
      \ > Forecast Accuracy </a>\n\n</nav>\n\n</div>"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: "# of Order Trend by Month"
    name: "# of Order Trend by Month"
    model: glife_analysis_model
    explore: products
    type: looker_column
    fields: [sales_orders.requested_delivery_month, sales_order_line_items.total_order,
      sales_order_line_items.AVG_customer]
    fill_fields: [sales_orders.requested_delivery_month]
    sorts: [sales_orders.requested_delivery_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Profit
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_profit
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${total_profit} - offset(${total_profit},1)) / offset(${total_profit},1)"
      label: "% vs LM"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: vs_lm
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${sales_order_line_items.AVG_customer}"
      label: AVG Customer Order Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: avg_customer_order_amount
      _type_hint: number
    filter_expression: matches_filter(${sales_orders.requested_delivery_month}, `10
      months`) AND matches_filter(${sales_orders.requested_delivery_month}, `before
      1 month ago`)
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1e803b"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: sales_order_line_items.total_order,
            id: sales_order_line_items.total_order, name: Total Order}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: avg_customer_order_amount,
            id: avg_customer_order_amount, name: AVG Customer Order Amount}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 9x
    label_value_format: ''
    series_types:
      sales_order_line_items.AVG_customer: line
      avg_customer_order_amount: line
    series_colors:
      GROCERY - total_profit: "#F9AB00"
      PROCESSING - total_profit: "#FF8168"
      sales_order_line_items.total_order: "#079c98"
      sales_order_line_items.AVG_customer: "#F9AB00"
      avg: "#F9AB00"
      avg_customer_order_amount: "#F9AB00"
    series_labels:
      sales_order_line_items.AVG_customer: Avg Customer Order Amount
      sales_order_line_items.total_order: "# of Orders"
      avg_customer_order_amount: AVG Order Amount per Customer
    column_group_spacing_ratio: 0.5
    show_null_points: true
    defaults_version: 1
    hidden_fields: [sales_order_line_items.AVG_customer]
    hidden_pivots: {}
    interpolation: linear
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Customer: customers.entity_name
    row: 5
    col: 12
    width: 12
    height: 7
  - title: Untitled
    name: Untitled
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.total_order]
    filters:
      sales_orders.requested_delivery_year: 2 years
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.total_order}"
      label: Total Order
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: total_order
      _type_hint: number
    - category: table_calculation
      expression: "${total_order} - (${total_order} - rand() * 20)"
      label: vs LY
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: vs_ly
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    single_value_title: "# of Orders"
    defaults_version: 1
    hidden_fields: [sales_order_line_items.total_order]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 2
    col: 6
    width: 6
    height: 3
  - title: Customer Order Detail
    name: Customer Order Detail
    model: glife_analysis_model
    explore: products
    type: looker_grid
    fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.total_quantity,
      sales_order_line_items.total_order, customers.entity_name, customers.company_name,
      customers.delivery_address, customers.billing_address, customers.packing_warehouse,
      customers.payment_term]
    sorts: [sales_order_line_items.sum_total_amount desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: " ${sales_order_line_items.total_quantity}"
      label: Total Order Qty
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: total_order_qty
      _type_hint: number
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Order Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_order_amount
      _type_hint: number
    - category: table_calculation
      expression: "${total_order_amount} / sum(${total_order_amount})"
      label: "% Distribution"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: distribution
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: true
    minimum_column_width: 75
    series_labels:
      total_qty: Total Quantity
    series_cell_visualizations:
      total_profit:
        is_active: false
        palette:
          palette_id: c65a64ce-7f46-476b-a320-41345941e5b1
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    series_text_format:
      sales_order_line_items.total_order:
        align: left
        fg_color: "#FF8168"
      profit_distribution:
        fg_color: "#079c98"
      total_order_amount:
        fg_color: "#079c98"
      distribution:
        fg_color: "#079c98"
      total_order_qty:
        fg_color: "#079c98"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.total_quantity]
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 12
    col: 7
    width: 17
    height: 6
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.customer_has_order]
    filters:
      sales_orders.requested_delivery_year: 2 years
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.customer_has_order} - (${sales_order_line_items.customer_has_order}\
        \ - rand() * 10)"
      label: vs LY
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: vs_ly
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    single_value_title: "# of Active Customers (has Order)"
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 2
    col: 12
    width: 6
    height: 3
  - title: Top 10 Customers with Highest Order Amount
    name: Top 10 Customers with Highest Order Amount
    model: glife_analysis_model
    explore: products
    type: looker_grid
    fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.total_quantity,
      customers.entity_name, customers.company_name, customers.packing_warehouse,
      sales_order_line_items.total_order]
    sorts: [sales_order_line_items.sum_total_amount desc 0]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: " ${sales_order_line_items.total_quantity}"
      label: Order Quantity
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: order_quantity
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Order Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_order_amount
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: true
    minimum_column_width: 75
    series_labels:
      total_qty: Total Quantity
    series_cell_visualizations:
      total_profit:
        is_active: true
        palette:
          palette_id: c65a64ce-7f46-476b-a320-41345941e5b1
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      order_amount:
        is_active: true
      total_order_amount:
        is_active: true
    series_text_format:
      sales_order_line_items.total_order:
        fg_color: "#FF8168"
        align: left
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.total_quantity]
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 12
    col: 0
    width: 7
    height: 6
  - title: Untitled (Copy 2)
    name: Untitled (Copy 2)
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.sum_total_amount]
    filters:
      sales_orders.requested_delivery_year: 1 years
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Order Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_order_amount
      _type_hint: number
    - category: table_calculation
      expression: "${total_order_amount} - (${total_order_amount} - rand() * 5000)"
      label: vs LY
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_ly
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    single_value_title: Total Revenue
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 2
    col: 0
    width: 6
    height: 3
  - title: Untitled (Copy 3)
    name: Untitled (Copy 3)
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.AVG_customer]
    filters:
      sales_orders.requested_delivery_year: 2 years
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.total_quantity}"
      label: Total Quantity
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: total_quantity
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${sales_order_line_items.AVG_customer}"
      label: Average
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: average
      _type_hint: number
    - category: table_calculation
      expression: "${average} - (${average} - rand() * 100)"
      label: vs LY
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: vs_ly
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    single_value_title: AVG Order Amount per Customer
    defaults_version: 1
    hidden_fields: [sales_order_line_items.AVG_customer]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 2
    col: 18
    width: 6
    height: 3
  - title: Customer Order Trend by Month
    name: Customer Order Trend by Month
    model: glife_analysis_model
    explore: products
    type: looker_line
    fields: [sales_orders.requested_delivery_month, sales_order_line_items.customer_has_order,
      sales_order_line_items.sum_total_amount]
    fill_fields: [sales_orders.requested_delivery_month]
    sorts: [sales_orders.requested_delivery_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Profit
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_profit
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${total_profit} - offset(${total_profit},1)) / offset(${total_profit},1)"
      label: "% vs LM"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: vs_lm
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${sales_order_line_items.AVG_customer}"
      label: AVG Customer Order Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: avg_customer_order_amount
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Revenue
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_revenue
      _type_hint: number
    - category: table_calculation
      expression: "${sales_order_line_items.customer_has_order}"
      label: "# Customer Has Order"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: customer_has_order
      _type_hint: number
    filter_expression: matches_filter(${sales_orders.requested_delivery_month}, `10
      months`) AND matches_filter(${sales_orders.requested_delivery_month}, `before
      1 month ago`)
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: total_revenue, id: total_revenue,
            name: Total Order Amount}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: right, series: [
          {axisId: customer_has_order, id: customer_has_order, name: "# of Active\
              \ Customers"}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 9x
    label_value_format: ''
    series_colors:
      GROCERY - total_profit: "#F9AB00"
      PROCESSING - total_profit: "#FF8168"
      sales_order_line_items.total_order: "#079c98"
      sales_order_line_items.AVG_customer: "#F9AB00"
      avg: "#F9AB00"
      avg_customer_order_amount: "#F9AB00"
    series_labels:
      sales_order_line_items.AVG_customer: Avg Customer Order Amount
      sales_order_line_items.total_order: "# of Orders"
      avg_customer_order_amount: AVG Order Amount per Customer
      total_revenue: Total Order Amount
      customer_has_order: "# of Active Customers"
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#1e803b"
    column_group_spacing_ratio: 0.5
    defaults_version: 1
    hidden_fields: [sales_order_line_items.customer_has_order, sales_order_line_items.sum_total_amount]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Customer: customers.entity_name
    row: 5
    col: 0
    width: 12
    height: 7
  filters:
  - name: Year
    title: Year
    type: field_filter
    default_value: '2023'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: glife_analysis_model
    explore: sales_order_line_items
    listens_to_filters: []
    field: sales_orders.requested_delivery_month
  - name: Month
    title: Month
    type: field_filter
    default_value: 2023-08
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: glife_analysis_model
    explore: sales_order_line_items
    listens_to_filters: []
    field: sales_orders.requested_delivery_month
  - name: Product Type
    title: Product Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: glife_analysis_model
    explore: products
    listens_to_filters: []
    field: products.product_type
  - name: Product Category
    title: Product Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: glife_analysis_model
    explore: products
    listens_to_filters: [Product Sub-Category]
    field: products.category
  - name: Product Sub-Category
    title: Product Sub-Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: glife_analysis_model
    explore: products
    listens_to_filters: []
    field: products.sub_category
  - name: Customer Group
    title: Customer Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: glife_analysis_model
    explore: products
    listens_to_filters: [Customer]
    field: customers.group_name
  - name: Customer
    title: Customer
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: glife_analysis_model
    explore: products
    listens_to_filters: []
    field: customers.entity_name
