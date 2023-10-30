---
- dashboard: poc__inventory_analysis
  title: POC - Inventory Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: UErq5POL1PC9VQFoSvtuT1
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border-bottom: solid 1px #000;\">\n \n<nav style=\"font-size:\
      \ 18px; padding: 5px 10px 0 10px; height: 60px\" >\n\n<a style=\"padding: 5px\
      \ 15px; border-bottom: solid 1px #000;color: #079c98; float: left; line-height:\
      \ 40px; \" href=\"/dashboards/49\" >  Sales Analysis </a>\n\n<a style=\"padding:\
      \ 5px 15px; border-bottom: solid 1px #000;color: #079c98; float: left; line-height:\
      \ 40px; \" href=\"/dashboards/50\" >  Customer Analysis </a>\n\n\n<a style=\"\
      padding: 5px 15px; border-bottom: solid 1px #000;color: #079c98; float: left;\
      \ line-height: 40px; \" href=\"/dashboards/51\" >  Delivery Analysis </a>\n\n\
      \n<a style=\"padding: 5px 15px; float: left; line-height: 40px; border-radius:\
      \ 5px 5px 0 0; font-weight: bold; color:#fff; background-color: #079c98\" href=\"\
      #\" class=\"test\"> Inventory Analysis </a>\n\n<a style=\"padding: 5px 15px;\
      \ border-bottom: solid 1px #000;color: #079c98; float: left; line-height: 40px;\"\
      \ href=\"/dashboards/53\" > Forecast Accuracy </a>\n\n\n</nav>\n\n</div>"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Untitled (Copy 2)
    name: Untitled (Copy 2)
    model: glife_analysis_model
    explore: stock_value
    type: single_value
    fields: [stock_value.count, stock_qty]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${stock_qty}"
      label: Stock Quantity
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: stock_quantity
      _type_hint: number
    - category: table_calculation
      expression: "${stock_quantity} - (${stock_quantity} - rand() * 10000)"
      label: vs Yesterday
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: vs_yesterday
      _type_hint: number
    - category: measure
      expression:
      label: Stock Qty
      value_format:
      value_format_name:
      based_on: stock_value.qty
      _kind_hint: measure
      measure: stock_qty
      type: sum
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    single_value_title: Stock Quantity
    defaults_version: 1
    hidden_fields: [stock_value.count, stock_qty]
    hidden_pivots: {}
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 2
    col: 5
    width: 5
    height: 3
  - title: Stock Value Trend Last Week
    name: Stock Value Trend Last Week
    model: glife_analysis_model
    explore: stock_value
    type: looker_line
    fields: [stock_value.balance_vaule, stock_value.product_type, week]
    filters:
      week: "-Other"
    sorts: [stock_value.balance_vaule desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${stock_value.count}"
      label: "# of Stocked Product"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: of_stocked_product
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${of_stocked_product} - (${of_stocked_product} - rand() * 100)"
      label: vs Yesterday
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_yesterday
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Stock In Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_in
      _kind_hint: measure
      measure: stock_in_value
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: Stock Out Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_out
      _kind_hint: measure
      measure: stock_out_value
      type: sum
      _type_hint: number
    - category: table_calculation
      expression: "${stock_in_value}"
      label: Stock In
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_in
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${stock_in} - ${stock_in} * 0.95"
      label: vs LM
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_lm
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${stock_value.balance_vaule}"
      label: Stock Value
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_value
      _type_hint: number
    - category: dimension
      description: ''
      label: Week
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: week
      args:
      - stock_value.product_type
      - - label: Monday
          filter: FRESH PRODUCT
        - label: Tuesday
          filter: FROZEN FOODS
        - label: Wednesday
          filter: PROCESSING
        - label: Thursday
          filter: GROCERY
        - label: Friday
          filter: DC
        - label: Saturday
          filter: PACKAGING
        - label: Sunday
          filter: GL
      - Other
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: |-
        if(${week} = "Tuesday", ${stock_value} * 5,
          if(${week} = "Wednesday", ${stock_value}* 71,
          if(${week} = "Thursday",${stock_value} * 140,
            if(${week} = "Friday", ${stock_value} * 2800,
            if(${week} = "Saturday", (${stock_value} * 400000), if(${week} = "Sunday", -(${stock_value} * 100000), ${stock_value}))))))
      label: Stock Value
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_value_1
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
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: stock_value_1, id: stock_value_1,
            name: Stock Value}], showLabels: false, showValues: false, maxValue: 700000000,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      stock_value_1: "#079c98"
    custom_color_enabled: true
    custom_color: "#079c98"
    show_single_value_title: true
    single_value_title: Stock In Value
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [stock_value.product_type, stock_value.balance_vaule, stock_value]
    hidden_pivots: {}
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 5
    col: 0
    width: 12
    height: 7
  - title: Inventory Detail
    name: Inventory Detail
    model: glife_analysis_model
    explore: stock_value
    type: looker_grid
    fields: [stock_value.product_code, stock_value.product_name, stock_value.product_type,
      stock_value.category, stock_in_value, stock_out_value, stock_value.balance_vaule,
      stock_value.stock_cover_day, stock_quantity]
    filters:
      stock_value.qty: ">0"
    sorts: [stock_in_value desc 0]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${stock_quantity}"
      label: Stock Quantity
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: stock_quantity_1
      _type_hint: number
    - category: measure
      expression:
      label: Stock In Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_in
      _kind_hint: measure
      measure: stock_in_value
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: Stock Out Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_out
      _kind_hint: measure
      measure: stock_out_value
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: Stock Quantity
      value_format:
      value_format_name:
      based_on: stock_value.qty
      _kind_hint: measure
      measure: stock_quantity
      type: sum
      _type_hint: number
    - category: table_calculation
      expression: "${stock_in_value}"
      label: Stock In
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_in
      _type_hint: number
    - category: table_calculation
      expression: "${stock_out_value}"
      label: Stock Out
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_out
      _type_hint: number
    - category: table_calculation
      expression: "${stock_value.balance_vaule}"
      label: Stock Value
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_value
      _type_hint: number
    - category: table_calculation
      expression: "${stock_value.stock_cover_day} + 3"
      label: DII
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: dii
      _type_hint: number
    - category: table_calculation
      expression: "${dii} + rand() * 40"
      label: Stock Cover Days
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: stock_cover_days
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
    series_cell_visualizations:
      stock_in_value:
        is_active: true
    custom_color_enabled: true
    custom_color: "#079c98"
    show_single_value_title: true
    single_value_title: Stock In Value
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_fields: [stock_in_value, stock_out_value, stock_value.balance_vaule, stock_value.stock_cover_day,
      stock_quantity, dii]
    hidden_pivots: {}
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 12
    col: 12
    width: 12
    height: 7
  - title: Untitled
    name: Untitled
    model: glife_analysis_model
    explore: stock_value
    type: single_value
    fields: [stock_value.balance_vaule]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${stock_value.balance_vaule}"
      label: Balance Value
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: balance_value
      _type_hint: number
    - category: table_calculation
      expression: "${balance_value} - (${stock_value.balance_vaule} - rand() * 1000000)"
      label: vs Yesterday
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_yesterday
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    single_value_title: Total Stock Value
    defaults_version: 1
    hidden_fields: [stock_value.balance_vaule]
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 2
    col: 0
    width: 5
    height: 3
  - title: Untitled (Copy 3)
    name: Untitled (Copy 3)
    model: glife_analysis_model
    explore: stock_value
    type: single_value
    fields: [stock_out_value]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${stock_value.count}"
      label: "# of Stocked Product"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: of_stocked_product
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${of_stocked_product} - (${of_stocked_product} - rand() * 100)"
      label: vs Yesterday
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_yesterday
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Stock In Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_in
      _kind_hint: measure
      measure: stock_in_value
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: Stock Out Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_out
      _kind_hint: measure
      measure: stock_out_value
      type: sum
      _type_hint: number
    - category: table_calculation
      expression: "${stock_out_value} /1000"
      label: Stock Out
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_out
      _type_hint: number
    - category: table_calculation
      expression: "${stock_out} - ${stock_out} * 0.95"
      label: vs LM
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_lm
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    single_value_title: Stock Out Value
    defaults_version: 1
    hidden_fields: [stock_out_value]
    hidden_pivots: {}
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 2
    col: 15
    width: 5
    height: 3
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: glife_analysis_model
    explore: stock_value
    type: single_value
    fields: [stock_in_value]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${stock_value.count}"
      label: "# of Stocked Product"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: of_stocked_product
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${of_stocked_product} - (${of_stocked_product} - rand() * 100)"
      label: vs Yesterday
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_yesterday
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Stock In Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_in
      _kind_hint: measure
      measure: stock_in_value
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: Stock Out Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_out
      _kind_hint: measure
      measure: stock_out_value
      type: sum
      _type_hint: number
    - category: table_calculation
      expression: "${stock_in_value} / 10000"
      label: Stock In
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_in
      _type_hint: number
    - category: table_calculation
      expression: "${stock_in} - ${stock_in} * 0.95"
      label: vs LM
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_lm
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
    single_value_title: Stock In Value
    defaults_version: 1
    hidden_fields: [stock_in_value]
    hidden_pivots: {}
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 2
    col: 10
    width: 5
    height: 3
  - title: Stock Value by Product Category
    name: Stock Value by Product Category
    model: glife_analysis_model
    explore: stock_value
    type: looker_pie
    fields: [stock_value.balance_vaule, stock_value.category]
    filters:
      stock_value.product_type: "-PACKAGING,-GL"
    sorts: [stock_value.balance_vaule desc 0]
    limit: 20
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_colors:
      FRESH PRODUCT: "#079c98"
      GL: "#1A73E8"
      Fruits: "#079c98"
      Plant-Based: "#F9AB00"
      CABBAGE, SPINACH & G: "#E52592"
    defaults_version: 1
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 12
    col: 6
    width: 6
    height: 7
  - title: Stock In/Out Trend Last Week
    name: Stock In/Out Trend Last Week
    model: glife_analysis_model
    explore: stock_value
    type: looker_line
    fields: [stock_value.product_type, week, stock_in_value, stock_out_value]
    filters:
      stock_value.product_type: "-OTHERS,-JUICE"
    sorts: [stock_in_value desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${stock_value.count}"
      label: "# of Stocked Product"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: of_stocked_product
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${of_stocked_product} - (${of_stocked_product} - rand() * 100)"
      label: vs Yesterday
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_yesterday
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Stock In Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_in
      _kind_hint: measure
      measure: stock_in_value
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: Stock Out Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_out
      _kind_hint: measure
      measure: stock_out_value
      type: sum
      _type_hint: number
    - category: table_calculation
      expression: "${stock_in_value}"
      label: Stock In
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_in
      _type_hint: number
      is_disabled: false
    - category: table_calculation
      expression: "${stock_in} - ${stock_in} * 0.95"
      label: vs LM
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: vs_lm
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${stock_value.balance_vaule}"
      label: Stock Value
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_value
      _type_hint: number
      is_disabled: true
    - category: dimension
      description: ''
      label: Week
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: week
      args:
      - stock_value.product_type
      - - label: Monday
          filter: FRESH PRODUCT
        - label: Tuesday
          filter: FROZEN FOODS
        - label: Wednesday
          filter: PROCESSING
        - label: Thursday
          filter: GROCERY
        - label: Friday
          filter: DC
        - label: Saturday
          filter: PACKAGING
      - Sunday
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: |-
        if(${week} = "Tuesday", ${stock_in} * 8,
          if(${week} = "Wednesday", ${stock_in}* 30,
          if(${week} = "Thursday",${stock_in} * 200,
            if(${week} = "Friday", ${stock_in} * 5000,
            if(${week} = "Saturday", (${stock_in} * 5100), if(${week} = "Sunday", (${stock_in} + 100000000), ${stock_in}))))))
      label: Stock In Value
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_in_value_1
      _type_hint: number
    - category: table_calculation
      expression: "${stock_out_value} * 10"
      label: Stock Out
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_out
      _type_hint: number
    - category: table_calculation
      expression: |-
        if(${week} = "Tuesday", ${stock_out} * 8,
          if(${week} = "Wednesday", ${stock_out}* 5,
          if(${week} = "Thursday",${stock_out} * 80,
            if(${week} = "Friday", ${stock_out} * 800,
            if(${week} = "Saturday", (${stock_out} * 500), if(${week} = "Sunday", (${stock_out} + 70125821), ${stock_out}))))))
      label: Stock Out Value
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_out_value_1
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
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: stock_in, id: stock_in,
            name: Stock In}], showLabels: false, showValues: false, maxValue: 200000000,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      stock_value_1: "#079c98"
    custom_color_enabled: true
    custom_color: "#079c98"
    show_single_value_title: true
    single_value_title: Stock In Value
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [stock_value.product_type, stock_out_value, stock_in_value, stock_in,
      stock_out]
    hidden_pivots: {}
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 5
    col: 12
    width: 12
    height: 7
  - title: Stock Value by Product Type
    name: Stock Value by Product Type
    model: glife_analysis_model
    explore: stock_value
    type: looker_pie
    fields: [stock_value.balance_vaule, stock_value.product_type]
    filters:
      stock_value.product_type: "-PACKAGING,-GL"
    sorts: [stock_value.balance_vaule desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_colors:
      FRESH PRODUCT: "#079c98"
      GL: "#1A73E8"
    defaults_version: 1
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 12
    col: 0
    width: 6
    height: 7
  - title: Inventory Detail (Copy)
    name: Inventory Detail (Copy)
    model: glife_analysis_model
    explore: stock_value
    type: single_value
    fields: [stock_value.stock_cover_day]
    filters:
      stock_value.qty: ">0"
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${stock_quantity}"
      label: Stock Quantity
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: stock_quantity_1
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Stock In Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_in
      _kind_hint: measure
      measure: stock_in_value
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: Stock Out Value
      value_format:
      value_format_name:
      based_on: stock_value.stock_out
      _kind_hint: measure
      measure: stock_out_value
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: Stock Quantity
      value_format:
      value_format_name:
      based_on: stock_value.qty
      _kind_hint: measure
      measure: stock_quantity
      type: sum
      _type_hint: number
    - category: table_calculation
      expression: "${stock_in_value}"
      label: Stock In
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_in
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${stock_out_value}"
      label: Stock Out
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_out
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${stock_value.balance_vaule}"
      label: Stock Value
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: stock_value
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${stock_value.stock_cover_day} + 3"
      label: DII
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: dii
      _type_hint: number
    - category: table_calculation
      expression: "${dii}/4000 + 3"
      label: Stock Cover Days
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: stock_cover_days
      _type_hint: number
    - category: table_calculation
      expression: "${stock_cover_days} - (${stock_cover_days} - rand() * 20)"
      label: vs LM
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: vs_lm
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    single_value_title: Stock Cover Days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    truncate_header: true
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      stock_in_value:
        is_active: true
    table_theme: editable
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    hidden_fields: [stock_value.stock_cover_day, dii]
    hidden_pivots: {}
    hide_totals: false
    hide_row_totals: false
    listen:
      Fillter Date: stock_value.fillter_date
      Product Category: stock_value.category
      Product Sub Category: stock_value.sub_category
      Product Name: stock_value.product_name
    row: 2
    col: 20
    width: 4
    height: 3
  filters:
  - name: Fillter Date
    title: Fillter Date
    type: field_filter
    default_value: 2023/10/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: glife_analysis_model
    explore: stock_value
    listens_to_filters: []
    field: stock_value.fillter_date
  - name: Product Type
    title: Product Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: glife_analysis_model
    explore: stock_value
    listens_to_filters: []
    field: stock_value.product_type
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
    explore: stock_value
    listens_to_filters: [Product Sub Category]
    field: stock_value.category
  - name: Product Sub Category
    title: Product Sub Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: glife_analysis_model
    explore: stock_value
    listens_to_filters: [Product Name]
    field: stock_value.sub_category
  - name: Product Name
    title: Product Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: glife_analysis_model
    explore: stock_value
    listens_to_filters: []
    field: stock_value.product_name
