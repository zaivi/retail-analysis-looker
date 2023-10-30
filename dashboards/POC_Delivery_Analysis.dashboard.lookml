---
- dashboard: poc__delivery_analysis
  title: POC - Delivery Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: m308rWWD27juHd60LUry4v
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border-bottom: solid 1px #000;\">\n \n<nav style=\"font-size:\
      \ 18px; padding: 5px 10px 0 10px; height: 60px\" >\n\n<a style=\"padding: 5px\
      \ 15px; border-bottom: solid 1px #000;color: #079c98; float: left; line-height:\
      \ 40px; \" href=\"/dashboards/16\" >  Sales Analysis </a>\n\n<a style=\"padding:\
      \ 5px 15px; border-bottom: solid 1px #000;color: #079c98; float: left; line-height:\
      \ 40px; \" href=\"/dashboards/17\" >  Customer Analysis </a>\n\n\n<a style=\"\
      padding: 5px 15px; float: left; line-height: 40px; border-radius: 5px 5px 0\
      \ 0; font-weight: bold; color:#fff; background-color: #079c98\" href=\"#\" class=\"\
      test\"> Delivery Analysis </a>\n\n\n<a style=\"padding: 5px 15px; border-bottom:\
      \ solid 1px #000;color: #079c98; float: left; line-height: 40px;\" href=\"/dashboards/20\"\
      \ > Inventory Analysis </a>\n\n\n<a style=\"padding: 5px 15px; border-bottom:\
      \ solid 1px #000;color: #079c98; float: left; line-height: 40px;\" href=\"/dashboards/48\"\
      \ > Forecast Accuracy </a>\n\n</nav>\n\n</div>"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Untitled
    name: Untitled
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.total_order]
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
    single_value_title: "# of Delivered Orders"
    defaults_version: 1
    hidden_fields: [sales_order_line_items.total_order]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Customer: customers.entity_name
      Month: sales_orders.requested_delivery_month
    row: 2
    col: 6
    width: 6
    height: 3
  - title: To be Delivered Orders Detail
    name: To be Delivered Orders Detail
    model: glife_analysis_model
    explore: products
    type: looker_grid
    fields: [customers.packing_warehouse, sales_order_line_items.product_name, customers.entity_name,
      customers.company_name, sales_order_line_items.sum_total_amount, sales_order_line_items.total_quantity]
    sorts: [sales_order_line_items.sum_total_amount desc]
    limit: 500
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
      is_disabled: false
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
    enable_conditional_formatting: true
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
      order_quantity: Total Order Quantity
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
      order_quantity:
        fg_color: "#079c98"
    header_background_color: ''
    conditional_formatting: [{type: greater than, value: 1, background_color: "#FF8168",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [total_order_amount]}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.total_quantity]
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Customer: customers.entity_name
      Month: sales_orders.requested_delivery_month
    row: 12
    col: 12
    width: 12
    height: 7
  - title: Untitled (Copy 2)
    name: Untitled (Copy 2)
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.sum_total_amount]
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
    single_value_title: Total Delivery Amount
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Customer: customers.entity_name
      Month: sales_orders.requested_delivery_month
    row: 2
    col: 0
    width: 6
    height: 3
  - title: To be Delivered Amount by Packing Warehouse
    name: To be Delivered Amount by Packing Warehouse
    model: glife_analysis_model
    explore: products
    type: looker_pie
    fields: [customers.packing_warehouse, sales_order_line_items.sum_total_amount]
    sorts: [sales_order_line_items.sum_total_amount desc 0]
    limit: 2
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: " ${sales_order_line_items.total_quantity}"
      label: Total Qty
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: total_qty
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount} * 0.4"
      label: Total Order Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_order_amount
      _type_hint: number
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total
      _type_hint: number
      is_disabled: true
    - category: dimension
      expression: |-
        if(${products.product_type} = "DC",1,
          if(${products.product_type} = "FRESH PRODUCT",2,
            if(${products.product_type} = "FROZEN FOODS",3,
             if(${products.product_type} = "GROCERY",4,
              if(${products.product_type} = "PROCESSING",5,6)))))
      label: Product Type Sort
      value_format:
      value_format_name:
      dimension: product_type_sort
      _kind_hint: dimension
      _type_hint: number
    - category: table_calculation
      expression: "${sales_order_line_items.customer_has_order}"
      label: "# of Customer has Order"
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: of_customer_has_order
      _type_hint: number
      is_disabled: true
    value_labels: labels
    label_type: labVal
    series_colors:
      FROZEN FOODS: "#079c98"
      GROCERY: "#F9AB00"
      PROCESSING: "#FF8168"
      sales_order_line_items.sum_total_amount: "#079c98"
      total_profit: "#079c98"
      MY_TEAM: "#079c98"
      SG_TEAM: "#FF8168"
    series_labels:
      total_qty: Total Quantity
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: total_profit, id: total_profit,
            name: Total Profit}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: sales_order_line_items.customer_has_order,
            id: sales_order_line_items.customer_has_order, name: Customer Has Order}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
    series_cell_visualizations:
      total_profit:
        is_active: true
        palette:
          palette_id: c65a64ce-7f46-476b-a320-41345941e5b1
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Customer: customers.entity_name
      Month: sales_orders.requested_delivery_month
    row: 5
    col: 12
    width: 6
    height: 7
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.sum_total_amount]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(${total_order_amount}) * 0.4
      label: Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total
      _type_hint: number
    - category: table_calculation
      expression: "${total_order_amount} - (${total_order_amount} - rand() * 1000)"
      label: vs LY
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_ly
      _type_hint: number
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Order Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_order_amount
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
    custom_color: "#F9AB00"
    single_value_title: Total To be Delivered Amount
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount, total_order_amount]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Customer: customers.entity_name
      Month: sales_orders.requested_delivery_month
    row: 2
    col: 12
    width: 6
    height: 3
  - title: Untitled (Copy 3)
    name: Untitled (Copy 3)
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.total_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.total_order} * 0.3"
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
    custom_color: "#F9AB00"
    single_value_title: "# of To be Delivered Orders"
    defaults_version: 1
    hidden_fields: [sales_order_line_items.total_order]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Customer: customers.entity_name
      Month: sales_orders.requested_delivery_month
    row: 2
    col: 18
    width: 6
    height: 3
  - title: To be Delivered Amount by Product Type
    name: To be Delivered Amount by Product Type
    model: glife_analysis_model
    explore: products
    type: looker_pie
    fields: [sales_order_line_items.sum_total_amount, products.product_type]
    sorts: [sales_order_line_items.sum_total_amount desc 0]
    limit: 7
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: " ${sales_order_line_items.total_quantity}"
      label: Total Qty
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: total_qty
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
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total
      _type_hint: number
      is_disabled: true
    - category: dimension
      expression: |-
        if(${products.product_type} = "DC",1,
          if(${products.product_type} = "FRESH PRODUCT",2,
            if(${products.product_type} = "FROZEN FOODS",3,
             if(${products.product_type} = "GROCERY",4,
              if(${products.product_type} = "PROCESSING",5,6)))))
      label: Product Type Sort
      value_format:
      value_format_name:
      dimension: product_type_sort
      _kind_hint: dimension
      _type_hint: number
    - category: table_calculation
      expression: "${sales_order_line_items.customer_has_order}"
      label: "# of Customer has Order"
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: of_customer_has_order
      _type_hint: number
      is_disabled: true
    value_labels: labels
    label_type: labVal
    series_colors:
      FROZEN FOODS: "#12B5CB"
      GROCERY: "#F9AB00"
      PROCESSING: "#FF8168"
      sales_order_line_items.sum_total_amount: "#079c98"
      total_profit: "#079c98"
      MY_TEAM: "#079c98"
      SG_TEAM: "#FF8168"
      FRESH PRODUCT: "#079c98"
    series_labels:
      total_qty: Total Quantity
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: total_profit, id: total_profit,
            name: Total Profit}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: sales_order_line_items.customer_has_order,
            id: sales_order_line_items.customer_has_order, name: Customer Has Order}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
    series_cell_visualizations:
      total_profit:
        is_active: true
        palette:
          palette_id: c65a64ce-7f46-476b-a320-41345941e5b1
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Customer Group: customers.group_name
      Customer: customers.entity_name
      Month: sales_orders.requested_delivery_month
    row: 5
    col: 18
    width: 6
    height: 7
  - title: 'Delivery Amount Trend by Packing Warehouse by Month '
    name: 'Delivery Amount Trend by Packing Warehouse by Month '
    model: glife_analysis_model
    explore: products
    type: looker_column
    fields: [sales_orders.requested_delivery_month, sales_order_line_items.sum_total_amount,
      sales_order_line_items.sum_total_amount_ly, customers.packing_warehouse]
    pivots: [customers.packing_warehouse]
    fill_fields: [sales_orders.requested_delivery_month]
    sorts: [customers.packing_warehouse, sales_orders.requested_delivery_month]
    limit: 8
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_amount
      _type_hint: number
    - category: table_calculation
      expression: round(mod(${sales_order_line_items.sum_total_amount_ly} * 2,50)
        + 50,0)/100
      label: "% vs LY"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: vs_ly
      _type_hint: number
    filter_expression: matches_filter(${sales_orders.requested_delivery_month}, `NOT
      NULL`) AND matches_filter(${sales_orders.requested_delivery_month}, `before
      1 month ago`) AND matches_filter(${sales_orders.requested_delivery_month}, `10
      month`)
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
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#079c98"
    y_axes: [{label: '', orientation: left, series: [{axisId: MY_TEAM - total_amount,
            id: MY_TEAM - total_amount, name: MY_TEAM}, {axisId: SG_TEAM - total_amount,
            id: SG_TEAM - total_amount, name: SG_TEAM}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: SG_TEAM - vs_ly, id: SG_TEAM
              - vs_ly, name: "% vs LY"}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      SG_TEAM - vs_ly: line
    series_colors:
      MY_TEAM - total_amount: "#079c98"
      SG_TEAM - total_amount: "#FF8168"
      SG_TEAM - vs_ly: "#F9AB00"
    series_labels:
      MY_TEAM - total_amount: MY_TEAM
      SG_TEAM - total_amount: SG_TEAM
      SG_TEAM - vs_ly: "% vs LY"
    column_group_spacing_ratio: 0.2
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots:
      customers.packing_warehouse___null:
        is_entire_pivot_hidden: true
      MY_TEAM:
        measure_names:
        - vs_ly
    hidden_fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.sum_total_amount_ly]
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      Year: sales_orders.requested_delivery_month
    row: 5
    col: 0
    width: 12
    height: 7
  - title: "# of Order Trend by Packing Warehouse by Month"
    name: "# of Order Trend by Packing Warehouse by Month"
    model: glife_analysis_model
    explore: products
    type: looker_line
    fields: [sales_orders.requested_delivery_month, customers.packing_warehouse, sales_order_line_items.total_order]
    pivots: [customers.packing_warehouse]
    fill_fields: [sales_orders.requested_delivery_month]
    sorts: [customers.packing_warehouse, sales_orders.requested_delivery_month]
    limit: 8
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_amount
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: round(mod(${sales_order_line_items.sum_total_amount_ly} * 2,50)
        + 50,0)/100
      label: "% vs LY"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: vs_ly
      _type_hint: number
      is_disabled: true
    filter_expression: matches_filter(${sales_orders.requested_delivery_month}, `NOT
      NULL`) AND matches_filter(${sales_orders.requested_delivery_month}, `before
      1 month ago`) AND matches_filter(${sales_orders.requested_delivery_month}, `10
      month`)
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: sales_order_line_items.total_order,
            id: MY_TEAM - sales_order_line_items.total_order, name: MY_TEAM}, {axisId: sales_order_line_items.total_order,
            id: SG_TEAM - sales_order_line_items.total_order, name: SG_TEAM}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      MY_TEAM - total_amount: "#079c98"
      SG_TEAM - total_amount: "#FF8168"
      SG_TEAM - vs_ly: "#F9AB00"
      MY_TEAM - sales_order_line_items.total_order: "#079c98"
      SG_TEAM - sales_order_line_items.total_order: "#FF8168"
    series_labels:
      MY_TEAM - total_amount: MY_TEAM
      SG_TEAM - total_amount: SG_TEAM
      SG_TEAM - vs_ly: "% vs LY"
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    column_group_spacing_ratio: 0.2
    defaults_version: 1
    hidden_pivots:
      customers.packing_warehouse___null:
        is_entire_pivot_hidden: true
      MY_TEAM:
        measure_names: []
    hidden_fields: []
    listen: {}
    row: 12
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
