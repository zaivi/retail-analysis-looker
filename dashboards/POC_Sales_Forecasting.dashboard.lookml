---
- dashboard: poc__sales_forecasting
  title: POC - Sales Forecasting
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: TOT3qIOeMnlsZyql38A5k3
  elements:
  - title: Sales Amount Forecast by Date
    name: Sales Amount Forecast by Date
    model: glife_analysis_model
    explore: sales_amount_forecast
    type: looker_line
    fields: [sales_amount_forecast.order_date, sales_amount_forecast.sales_amount,
      sales_amount_forecast.forecast_type]
    pivots: [sales_amount_forecast.forecast_type]
    fill_fields: [sales_amount_forecast.order_date]
    sorts: [sales_amount_forecast.forecast_type, sales_amount_forecast.order_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_amount_forecast.sales_amount}"
      label: Sales Amt
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sales_amt
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: sales_amt, id: Actual
              - sales_amt, name: Actual}, {axisId: sales_amt, id: Forecast - sales_amt,
            name: Forecast}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Actual - sales_amt: "#7CB342"
      Forecast - sales_amt: "#079c98"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#FF8168"}]
    hidden_pivots: {}
    hidden_fields: [sales_amount_forecast.sales_amount]
    defaults_version: 1
    listen:
      Month: sales_amount_forecast.order_month
      Year: sales_amount_forecast.order_year
    row: 2
    col: 0
    width: 24
    height: 8
  - title: Sales Amount Actual vs Forecast
    name: Sales Amount Actual vs Forecast
    model: glife_analysis_model
    explore: sales_amount_forecast_l3m
    type: looker_line
    fields: [sales_amount_forecast_l3m.order_date, sales_amount_forecast_l3m.sales_amount,
      sales_amount_forecast_l3m.Actual_Forecast]
    pivots: [sales_amount_forecast_l3m.Actual_Forecast]
    fill_fields: [sales_amount_forecast_l3m.order_date]
    filters:
      sales_amount_forecast_l3m.order_date: 2023/07/01 to 2023/07/31
    sorts: [sales_amount_forecast_l3m.Actual_Forecast, sales_amount_forecast_l3m.order_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_amount_forecast_l3m.sales_amount}"
      label: Sales Amt
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sales_amt
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
    y_axes: [{label: '', orientation: left, series: [{axisId: sales_amt, id: Actual
              - sales_amt, name: Actual}, {axisId: sales_amt, id: Forecast - sales_amt,
            name: Forecast}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Actual - sales_amt: "#7CB342"
      Forecast - sales_amt: "#079c98"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#FF8168"}]
    defaults_version: 1
    hidden_pivots:
      Actual:
        measure_names:
        - sales_amount_forecast_l3m.sales_amount
    hidden_fields: [sales_amount_forecast_l3m.sales_amount]
    listen: {}
    row: 10
    col: 0
    width: 16
    height: 9
  - title: Sales Amount Forecast Accuracy
    name: Sales Amount Forecast Accuracy
    model: glife_analysis_model
    explore: sales_amount_forecast_l3m
    type: looker_grid
    fields: [sales_amount_forecast_l3m.order_date, sales_amount_forecast_l3m.sales_amount,
      sales_amount_forecast_l3m.Actual_Forecast]
    pivots: [sales_amount_forecast_l3m.Actual_Forecast]
    fill_fields: [sales_amount_forecast_l3m.order_date]
    filters:
      sales_amount_forecast_l3m.order_date: 2023/07/01 to 2023/07/31
    sorts: [sales_amount_forecast_l3m.Actual_Forecast, sales_amount_forecast_l3m.order_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sales_amount_forecast_l3m.sales_amount}"
      label: Sales Amount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sales_amount
      _type_hint: number
    - category: table_calculation
      expression: pivot_index(${sales_amount}, 1) - pivot_index(${sales_amount},2)
      label: Variance
      value_format:
      value_format_name: usd_0
      _kind_hint: supermeasure
      table_calculation: variance
      _type_hint: number
    - category: table_calculation
      expression: pivot_index(${sales_amount}, 2) / pivot_index(${sales_amount},1)
      label: "% Accuracy"
      value_format:
      value_format_name: percent_0
      _kind_hint: supermeasure
      table_calculation: accuracy
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
    column_order: ["$$$_row_numbers_$$$", sales_amount_forecast_l3m.order_date, Forecast_sales_amount,
      Actual_sales_amount]
    show_totals: true
    show_row_totals: true
    truncate_header: true
    minimum_column_width: 90
    conditional_formatting: [{type: between, value: [0.9, 1.1], background_color: "#83b28f",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [accuracy]}]
    defaults_version: 1
    hidden_fields: [sales_amount_forecast_l3m.sales_amount]
    hidden_pivots: {}
    listen: {}
    row: 10
    col: 16
    width: 8
    height: 9
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
      padding: 5px 15px; border-bottom: solid 1px #000;color: #079c98; float: left;\
      \ line-height: 40px; \" href=\"/dashboards/19\" >  Delivery Analysis </a>\n\n\
      \n<a style=\"padding: 5px 15px; border-bottom: solid 1px #000;color: #079c98;\
      \ float: left; line-height: 40px;\" href=\"/dashboards/20\" > Inventory Analysis\
      \ </a>\n\n<a style=\"padding: 5px 15px; float: left; line-height: 40px; border-radius:\
      \ 5px 5px 0 0; font-weight: bold; color:#fff; background-color: #079c98\" href=\"\
      #\" class=\"test\"> Forecast Accuracy </a>\n\n\n</nav>\n\n</div>"
    row: 0
    col: 0
    width: 24
    height: 2
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
    explore: sales_amount_forecast
    listens_to_filters: []
    field: sales_amount_forecast.order_year
  - name: Month
    title: Month
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: glife_analysis_model
    explore: sales_amount_forecast
    listens_to_filters: []
    field: sales_amount_forecast.order_month
