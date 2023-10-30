---
- dashboard: poc__sales_analysis
  title: POC - Sales Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: HQCQR1KJ2Mewoy5QwCnWY7
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border-bottom: solid 1px #000;\">\n \n<nav style=\"font-size:\
      \ 18px; padding: 5px 10px 0 10px; height: 60px\" >\n\n<a style=\"padding: 5px\
      \ 15px; float: left; line-height: 40px; border-radius: 5px 5px 0 0; font-weight:\
      \ bold; color:#fff; background-color: #079c98\" href=\"#\" class=\"test\"> Sales\
      \ Analysis </a>\n\n<a style=\"padding: 5px 15px; border-bottom: solid 1px #000;color:\
      \ #079c98; float: left; line-height: 40px; \" href=\"/dashboards/17\" >  Customer\
      \ Analysis </a>\n\n\n<a style=\"padding: 5px 15px; border-bottom: solid 1px\
      \ #000; color: #079c98; float: left; line-height: 40px;\" href=\"/dashboards/19\"\
      \ > Delivery Analysis </a>\n\n\n<a style=\"padding: 5px 15px; border-bottom:\
      \ solid 1px #000;color: #079c98; float: left; line-height: 40px;\" href=\"/dashboards/20\"\
      \ > Inventory Analysis </a>\n\n<a style=\"padding: 5px 15px; border-bottom:\
      \ solid 1px #000;color: #079c98; float: left; line-height: 40px;\" href=\"/dashboards/48\"\
      \ > Forecast Accuracy </a>\n\n</nav>\n\n</div>"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Revenue Trend by Product Type by Month
    name: Revenue Trend by Product Type by Month
    model: glife_analysis_model
    explore: products
    type: looker_column
    fields: [sales_orders.requested_delivery_year, sales_orders.requested_delivery_month,
      sales_order_line_items.sum_total_amount, products.product_type, sales_order_line_items.sum_total_amount_ly]
    pivots: [products.product_type]
    sorts: [products.product_type, sales_orders.requested_delivery_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: if(${sales_orders.requested_delivery_year} >= date(2022,01,01) AND
        ${sales_orders.requested_delivery_year} < date(2023,01,01),${sales_order_line_items.sum_total_amount}/200,
        ${sales_order_line_items.sum_total_amount})
      label: Total Profit
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_profit
      _type_hint: number
      is_disabled: false
    - category: table_calculation
      expression: |-
        if(${sales_orders.requested_delivery_month}>= date(2022,10,01), 12000 - rand() * 2000,if(${sales_orders.requested_delivery_month}>= date(2022,11,01), 12000 - rand() * 2000,
            if(${sales_orders.requested_delivery_month}>= date(2022,12,01), 12000 - rand() * 2000,
              if(${sales_orders.requested_delivery_month}>= date(2023,01,01), 12000 - rand() * 2000,
                if(${sales_orders.requested_delivery_month}>= date(2023,02,01), 12000 - rand() * 2000,
                if(${sales_orders.requested_delivery_month}>= date(2023,03,01), 12000 - rand() * 2000,
                if(${sales_orders.requested_delivery_month}>= date(2023,04,01), 12000 - rand() * 2000,
                  if(${sales_orders.requested_delivery_month}>= date(2023,05,01), 12000 - rand() * 2000,
                    if(${sales_orders.requested_delivery_month}>= date(2023,06,01), 12000 - rand() * 2000,
                      if(${sales_orders.requested_delivery_month}>= date(2023,07,01), 12000 - rand() * 2000,
                        if(${sales_orders.requested_delivery_month}>= date(2023,08,01), 12000 - rand() * 2000,
                          if(${sales_orders.requested_delivery_month}>= date(2023,09,01), 12000 - rand() * 2000,
                            if(${sales_orders.requested_delivery_month}>= date(2023,10,01), 12000 - rand() * 2000,0)))))))))))))
      label: vs LY
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: vs_ly
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: round(if(${sales_orders.requested_delivery_year} >= date(2022,01,01)
        AND ${sales_orders.requested_delivery_year} < date(2023,01,01),${sales_order_line_items.sum_total_amount_ly}/200,
        ${sales_order_line_items.sum_total_amount_ly})/100 + 30,0)/10000
      label: Total Profit LY
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: total_profit_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${total_profit} - offset(${total_profit},1)) / offset(${total_profit},1)"
      label: vs LY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: vs_ly_1
      _type_hint: number
      is_disabled: true
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
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#1e803b"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: DC - total_profit, id: DC
              - total_profit, name: DC}, {axisId: FRESH PRODUCT - total_profit, id: FRESH
              PRODUCT - total_profit, name: FRESH PRODUCT}, {axisId: FROZEN FOODS
              - total_profit, id: FROZEN FOODS - total_profit, name: FROZEN FOOD},
          {axisId: GL - total_profit, id: GL - total_profit, name: GL}, {axisId: GROCERY
              - total_profit, id: GROCERY - total_profit, name: GROCERY}, {axisId: PACKAGING
              - total_profit, id: PACKAGING - total_profit, name: PACKAGING}, {axisId: PROCESSING
              - total_profit, id: PROCESSING - total_profit, name: PROCESSING}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: PROCESSING
              - total_profit_ly, id: PROCESSING - total_profit_ly, name: PROCESSING
              - Total Profit LY}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 9x
    label_value_format: ''
    series_types:
      FRESH PRODUCT - total_profit_ly: line
      PROCESSING - total_profit_ly: line
    series_colors:
      GROCERY - total_profit: "#F9AB00"
      PROCESSING - total_profit: "#FF8168"
      FRESH PRODUCT - total_profit_ly: "#F9AB00"
      PACKAGING - total_profit: "#9334E6"
      PROCESSING - total_profit_ly: "#F9AB00"
    series_labels:
      DC - total_profit: DC
      FRESH PRODUCT - total_profit: FRESH PRODUCT
      FRESH PRODUCT - total_profit_ly: Total Revenue LY
      FROZEN FOODS - total_profit: FROZEN FOOD
      GL - total_profit: GL
      GROCERY - total_profit: GROCERY
      PACKAGING - total_profit: PACKAGING
      PROCESSING - total_profit: PROCESSING
      PROCESSING - total_profit_ly: "% vs LY"
    column_group_spacing_ratio: 0.5
    show_null_points: true
    defaults_version: 1
    hidden_fields: [sales_orders.requested_delivery_year, sales_order_line_items.sum_total_amount,
      sales_order_line_items.sum_total_amount_ly]
    hidden_pivots:
      DC:
        measure_names:
        - total_profit_ly
      GL:
        measure_names:
        - total_profit_ly
      GROCERY:
        measure_names:
        - total_profit_ly
      PACKAGING:
        measure_names:
        - total_profit_ly
      PROCESSING:
        measure_names: []
      FROZEN FOODS:
        measure_names:
        - total_profit_ly
      FRESH PRODUCT:
        measure_names:
        - total_profit_ly
    interpolation: linear
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      'Customer Group ': customers.group_name
      Customer: customers.entity_name
    row: 5
    col: 0
    width: 7
    height: 6
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
      'Customer Group ': customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 2
    col: 6
    width: 6
    height: 3
  - title: Sold Products Detail
    name: Sold Products Detail
    model: glife_analysis_model
    explore: products
    type: looker_grid
    fields: [products.name, products.chinese_name, products.product_type, products.category,
      products.sub_category, sales_order_line_items.sum_total_amount, sales_order_line_items.total_quantity,
      sales_order_line_items.total_order, products.status]
    sorts: [sales_order_line_items.sum_total_amount desc]
    limit: 5000
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
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Profit
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_profit
      _type_hint: number
    - category: table_calculation
      expression: "${total_profit} / sum(${total_profit})"
      label: "% Profit Distribution"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: profit_distribution
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
      total_profit: Total Revenue
      profit_distribution: "% Revenue Distribution"
    series_cell_visualizations:
      total_profit:
        is_active: false
        palette:
          palette_id: c65a64ce-7f46-476b-a320-41345941e5b1
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    series_text_format:
      products.name: {}
      total_qty:
        fg_color: "#079c98"
        align: left
      total_profit:
        fg_color: "#079c98"
        align: left
      sales_order_line_items.total_order:
        align: left
        fg_color: "#FF8168"
      profit_distribution:
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
      'Customer Group ': customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 17
    col: 8
    width: 16
    height: 6
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.distinct_product]
    filters:
      sales_orders.requested_delivery_year: 2 years
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
      expression: "${total_profit} - offset(${total_profit},1)"
      label: vs LM
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_lm
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${sales_order_line_items.distinct_product} - (${sales_order_line_items.distinct_product}\
        \ - rand() * 20)"
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
    single_value_title: "# of Products has Order"
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      'Customer Group ': customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 2
    col: 18
    width: 6
    height: 3
  - title: Top 100 Products with Highest Revenue
    name: Top 100 Products with Highest Revenue
    model: glife_analysis_model
    explore: products
    type: looker_grid
    fields: [products.name, products.chinese_name, sales_order_line_items.sum_total_amount,
      sales_order_line_items.total_quantity]
    sorts: [sales_order_line_items.sum_total_amount desc 0]
    limit: 100
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
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Profit
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_profit
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
    minimum_column_width: 60
    series_labels:
      total_qty: Total Quantity
      total_profit: Total Revenue
    series_cell_visualizations:
      total_profit:
        is_active: true
        palette:
          palette_id: c65a64ce-7f46-476b-a320-41345941e5b1
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    series_text_format:
      products.name: {}
      total_qty:
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
      'Customer Group ': customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 17
    col: 0
    width: 8
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
      expression: sum(${total_profit})
      label: Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total
      _type_hint: number
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Profit
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_profit
      _type_hint: number
    - category: table_calculation
      expression: "${total_profit} - rand() * 5000"
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
    hidden_fields: [sales_order_line_items.sum_total_amount, total]
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      'Customer Group ': customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 2
    col: 0
    width: 6
    height: 3
  - title: Actual versus Target Revenue Trend by Month
    name: Actual versus Target Revenue Trend by Month
    model: glife_analysis_model
    explore: products
    type: looker_line
    fields: [sales_orders.requested_delivery_month, sales_order_line_items.sum_total_amount]
    fill_fields: [sales_orders.requested_delivery_month]
    filters:
      sales_orders.requested_delivery_year: '2023'
    sorts: [sales_orders.requested_delivery_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: if(${sales_orders.requested_delivery_month} < date(2023,01,01),
        ${sales_order_line_items.sum_total_amount} / 200, ${sales_order_line_items.sum_total_amount})
      label: Total Revenue
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_revenue
      _type_hint: number
    - category: table_calculation
      expression: if(extract_months(${sales_orders.requested_delivery_month}) <=9,
        ${total_revenue} * 0 + 1400000 + extract_months(${sales_orders.requested_delivery_month})
        * (1800000 - 1400000)/12, extract_months(${sales_orders.requested_delivery_month})
        * (1800000 - 1400000)/12 + 1400000 )
      label: Sales Target
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sales_target
      _type_hint: number
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
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: total_revenue, id: total_revenue,
            name: Total Revenue}, {axisId: sales_target, id: sales_target, name: Target
              Revenue}], showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sales_order_line_items.total_order: "#079c98"
      total_profit: "#1A73E8"
    series_labels:
      sales_order_line_items.total_order: "# of Orders"
      sales_target: Target Revenue
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    single_value_title: "# of Order"
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      'Customer Group ': customers.group_name
      Customer: customers.entity_name
    row: 11
    col: 0
    width: 14
    height: 6
  - title: Actual vs LY Revenue by Product Type
    name: Actual vs LY Revenue by Product Type
    model: glife_analysis_model
    explore: products
    type: looker_column
    fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.total_quantity,
      products.product_type, product_type_sort]
    filters:
      sales_orders.requested_delivery_year: 1 years
    sorts: [products.product_type]
    limit: 10
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
      label: Total Profit
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_profit
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total
      _type_hint: number
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
      expression: round(mod(if(${products.product_type} = "DC", ${total} - rand()*
        30, if(${products.product_type} = "FRESH PRODUCT", ${total} - rand() * 1000,
        if(${products.product_type} = "FROZEN FOODS", ${total} - rand() * 700, if(${products.product_type}
        = "GROCERY", ${total} - rand() * 40, if(${products.product_type} = "PROCESSING",
        ${total} - rand() * 1200, ${total}))))),50) + 50,0)/100
      label: Revenue LY
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: revenue_ly
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: total, id: total, name: Total}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: revenue_ly, id: revenue_ly, name: Revenue LY}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: false
    series_types:
      revenue_ly: line
    series_colors:
      FROZEN FOODS: "#079c98"
      GROCERY: "#F9AB00"
      PROCESSING: "#FF8168"
      total: "#079c98"
      revenue_ly: "#F9AB00"
    series_labels:
      total_qty: Total Quantity
      total: Total Revenue
      revenue_ly: "% vs LY"
    column_group_spacing_ratio: 0.5
    value_labels: legend
    label_type: labPer
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
    series_text_format:
      total_qty:
        fg_color: "#079c98"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.total_quantity,
      product_type_sort]
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      'Customer Group ': customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 5
    col: 14
    width: 10
    height: 6
  - title: Untitled (Copy 3)
    name: Untitled (Copy 3)
    model: glife_analysis_model
    explore: products
    type: single_value
    fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.total_order]
    filters:
      sales_orders.requested_delivery_year: 1 years
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(${total_profit})
      label: Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${total_profit} - offset(${total_profit},1)"
      label: vs LY
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_ly
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total Profit
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_profit
      _type_hint: number
      is_disabled: false
    - category: table_calculation
      expression: "${total_profit} / ${sales_order_line_items.total_order}"
      label: AVG Revenue per Order
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: avg_revenue_per_order
      _type_hint: number
    - category: table_calculation
      expression: "${avg_revenue_per_order} - (${avg_revenue_per_order} - rand() *\
        \ 10 )"
      label: vs LY
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: vs_ly_1
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
    single_value_title: AVG Revenue per Order
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount, sales_order_line_items.total_order,
      total_profit]
    hidden_pivots: {}
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      'Customer Group ': customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 2
    col: 12
    width: 6
    height: 3
  - title: Actual vs Target Revenue by Product Type
    name: Actual vs Target Revenue by Product Type
    model: glife_analysis_model
    explore: products
    type: looker_column
    fields: [products.product_type, product_type_sort, sales_order_line_items.sum_total_amount,
      sales_order_line_items.total_quantity]
    filters:
      sales_orders.requested_delivery_year: 1 years
    sorts: [products.product_type]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_order_line_items.sum_total_amount}"
      label: Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total
      _type_hint: number
    - category: table_calculation
      expression: round(mod(if(${products.product_type} = "DC", ${total} - rand()*
        30, if(${products.product_type} = "FRESH PRODUCT", ${total} - rand() * 1000,
        if(${products.product_type} = "FROZEN FOODS", ${total} - rand() * 700, if(${products.product_type}
        = "GROCERY", ${total} - rand() * 40, if(${products.product_type} = "PROCESSING",
        ${total} - rand() * 1200, ${total}))))),50) + 50,0)/100
      label: Target Revenue
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: target_revenue
      _type_hint: number
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: total, id: total, name: Total
              Revenue TY}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: '', orientation: right,
        series: [{axisId: target_revenue, id: target_revenue, name: Target Revenue}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: false
    series_types:
      target_revenue: line
    series_colors:
      FROZEN FOODS: "#079c98"
      GROCERY: "#F9AB00"
      PROCESSING: "#FF8168"
      total: "#079c98"
      revenue_ly: "#F9AB00"
      target_revenue: "#F9AB00"
    series_labels:
      total_qty: Total Quantity
      total: Total Revenue
      revenue_ly: Total Revenue LY
      target_revenue: "% vs Target"
    column_group_spacing_ratio: 0.5
    value_labels: legend
    label_type: labPer
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
    series_text_format:
      total_qty:
        fg_color: "#079c98"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [sales_order_line_items.sum_total_amount, product_type_sort, sales_order_line_items.total_quantity]
    listen:
      Product Type: products.product_type
      Product Sub-Category: products.sub_category
      Product Category: products.category
      'Customer Group ': customers.group_name
      Month: sales_orders.requested_delivery_month
      Customer: customers.entity_name
    row: 11
    col: 14
    width: 10
    height: 6
  - title: Revenue Forecast by Product Type by Month
    name: Revenue Forecast by Product Type by Month
    model: glife_analysis_model
    explore: product_type
    type: looker_column
    fields: [sales_amount_product_type_forecast.sales_amount, sales_amount_product_type_forecast.order_month,
      sales_amount_product_type_forecast.product_type, sales_ly]
    pivots: [sales_amount_product_type_forecast.product_type]
    fill_fields: [sales_amount_product_type_forecast.order_month]
    filters:
      sales_amount_product_type_forecast.order_date: 2023/08/01 to 2023/10/31
      product_type.product_type: FRESH PRODUCT,DC,FROZEN FOODS,GROCERY,PACKAGING,PROCESSING
    sorts: [sales_amount_product_type_forecast.product_type, sales_amount_product_type_forecast.order_month
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_amount_product_type_forecast.sales_amount}"
      label: Sales Forecast
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sales_forecast
      _type_hint: number
    - category: table_calculation
      expression: round(if(${sales_amount_product_type_forecast.order_month} >= date(2022,01,01)
        AND ${sales_amount_product_type_forecast.order_month} < date(2023,01,01),${sales_ly}/200,
        ${sales_ly})/100 + 30,0)/10000
      label: "% vs LY"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: vs_ly
      _type_hint: number
    - category: measure
      expression:
      label: Sales LY
      value_format:
      value_format_name:
      based_on: sales_amount_product_type_forecast.sum_total_amount_ly
      _kind_hint: measure
      measure: sales_ly
      type: sum
      _type_hint: number
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
    limit_displayed_rows: true
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
    totals_color: "#1e803b"
    y_axes: [{label: '', orientation: left, series: [{axisId: DC - sales_forecast,
            id: DC - sales_forecast, name: DC}, {axisId: FRESH PRODUCT - sales_forecast,
            id: FRESH PRODUCT - sales_forecast, name: FRESH PRODUCT}, {axisId: FROZEN
              FOODS - sales_forecast, id: FROZEN FOODS - sales_forecast, name: FROZEN
              FOODS}, {axisId: GROCERY - sales_forecast, id: GROCERY - sales_forecast,
            name: GROCERY}, {axisId: PACKAGING - sales_forecast, id: PACKAGING - sales_forecast,
            name: PACKAGING}, {axisId: PROCESSING - sales_forecast, id: PROCESSING
              - sales_forecast, name: PROCESSING}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: '', orientation: right, series: [{axisId: PROCESSING - vs_ly, id: PROCESSING
              - vs_ly, name: "% vs LY"}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types:
      PROCESSING - vs_ly: line
    series_colors:
      FROZEN FOODS - sales_forecast: "#079c98"
      PACKAGING - sales_forecast: "#9334E6"
      PROCESSING - sales_forecast: "#FF8168"
      PROCESSING - vs_ly: "#F9AB00"
    series_labels:
      DC - sales_forecast: DC
      FRESH PRODUCT - sales_forecast: FRESH PRODUCT
      FROZEN FOODS - sales_forecast: FROZEN FOODS
      GROCERY - sales_forecast: GROCERY
      PACKAGING - sales_forecast: PACKAGING
      PROCESSING - sales_forecast: PROCESSING
      PROCESSING - vs_ly: "% vs LY"
    column_group_spacing_ratio: 0.7
    hidden_fields: [sales_amount_product_type_forecast.sales_amount, sales_ly]
    defaults_version: 1
    hidden_pivots:
      DC:
        measure_names:
        - vs_ly
      FRESH PRODUCT:
        measure_names:
        - vs_ly
      FROZEN FOODS:
        measure_names:
        - vs_ly
      GROCERY:
        measure_names:
        - vs_ly
      PACKAGING:
        measure_names:
        - vs_ly
    listen: {}
    row: 5
    col: 7
    width: 7
    height: 6
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
  - name: 'Customer Group '
    title: 'Customer Group '
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
      type: tag_list
      display: popover
    model: glife_analysis_model
    explore: products
    listens_to_filters: []
    field: customers.entity_name
