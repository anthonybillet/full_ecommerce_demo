---
- dashboard: us_sales_regional_performance
  title: US Sales & Regional Performance
  preferred_viewer: dashboards-next
  style: modern
  crossfilter_enabled: true
  description: Interactive US regional sales, customer density, and product category
    performance with cross-filtering and multi-level drilling enabled
  preferred_slug: qQFvqNqHLRi2c5Spop5GIS
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Sales and Users by State
    name: Sales and Users by State
    model: full_ecommerce_demo
    explore: order_items
    type: looker_geo_choropleth
    fields: [order_items.total_sale_price, users.state, users.count]
    filters:
      users.country: USA,United States
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    table_theme: modern
    modern2026: true
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 16
    col: 0
    width: 27
    height: 10
    tab_name: ''
  - title: Sales and Users By Zip
    name: Sales and Users By Zip
    model: full_ecommerce_demo
    explore: order_items
    type: looker_google_map
    fields: [order_items.total_sale_price, users.zip, users.count]
    filters:
      users.country: USA,United States
    sorts: [order_items.total_sale_price desc 0]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    table_theme: modern
    modern2026: true
    defaults_version: 0
    map: usa
    map_projection: ''
    quantize_colors: false
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 8
    col: 27
    width: 24
    height: 18
    tab_name: ''
  - title: Sales and Users by Coordinates
    name: Sales and Users by Coordinates
    model: full_ecommerce_demo
    explore: order_items
    type: looker_google_map
    fields: [order_items.total_sale_price, users.count, users.location]
    filters:
      users.country: USA,United States
    sorts: [order_items.total_sale_price desc 0]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: person
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_radius_max: 10
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    table_theme: modern
    modern2026: true
    defaults_version: 0
    map: usa
    map_projection: ''
    quantize_colors: false
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 8
    col: 51
    width: 21
    height: 18
    tab_name: ''
  - title: Top Categories
    name: Top Categories
    model: full_ecommerce_demo
    explore: order_items
    type: looker_pie
    fields: [order_items.total_sale_price, products.category]
    filters:
      users.country: USA,United States
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
    column_limit: 50
    value_labels: labels
    label_type: labVal
    inner_radius: 50
    series_labels: {}
    hidden_fields: []
    hidden_points_if_no: []
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    table_theme: modern
    modern2026: true
    defaults_version: 1
    map: usa
    map_projection: ''
    quantize_colors: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 4
    col: 0
    width: 27
    height: 12
    tab_name: ''
  - title: Sales by Month
    name: Sales by Month
    model: full_ecommerce_demo
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      users.country: USA,United States
    sorts: [order_items.created_month desc]
    limit: 1000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Order Items Total Sale Price}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels: {}
    value_labels: labels
    label_type: labVal
    inner_radius: 50
    hidden_fields: []
    hidden_points_if_no: []
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    table_theme: modern
    modern2026: true
    defaults_version: 1
    map: usa
    map_projection: ''
    quantize_colors: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 27
    width: 45
    height: 8
    tab_name: ''
  - title: Total Sales
    name: Total Sales
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price]
    filters:
      users.country: USA,United States
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    table_theme: modern
    modern2026: true
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 27
    height: 4
    tab_name: ''
  - title: Tabular Sales
    name: Tabular Sales
    model: full_ecommerce_demo
    explore: order_items
    type: looker_grid
    fields: [users.state, users.city, order_items.count, order_items.total_sale_price,
      users.count]
    filters:
      users.country: USA,United States
    sorts: [order_items.total_sale_price desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${order_items.total_sale_price}/${users.count}"
      label: Avg Sales Per User
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: avg_sales_per_user
      _type_hint: number
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: modern
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    modern2026: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      order_items.count: Order Items
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
      users.count:
        is_active: true
      order_items.count:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [avg_sales_per_user]}]
    hidden_fields: []
    hidden_points_if_no: []
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map: usa
    map_projection: ''
    quantize_colors: false
    hidden_pivots: {}
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 26
    col: 0
    width: 72
    height: 24
    tab_name: ''
  - name: Customer Demographics & Acquisition
    type: text
    title_text: Customer Demographics & Acquisition
    subtitle_text: Click any Age Group, Gender, Traffic Source, or Customer Tenure
      / Repeat Status below to cross-filter the entire dashboard
    body_text: ''
    row: 50
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Users by Traffic source
    name: Users by Traffic source
    model: full_ecommerce_demo
    explore: order_items
    type: looker_pie
    fields: [users.traffic_source, users.count]
    filters:
      users.country: USA,United States
    sorts: [users.traffic_source, users.count desc]
    limit: 500
    column_limit: 15
    value_labels: legend
    label_type: labPer
    show_value_labels: true
    font_size: 13
    hide_legend: false
    series_colors: {}
    show_view_names: false
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: order_items.created_date
    row: 54
    col: 28
    width: 17
    height: 9
    tab_name: ''
  - title: 'Users by Gender '
    name: 'Users by Gender '
    model: full_ecommerce_demo
    explore: order_items
    type: looker_pie
    fields: [users.gender, users.count]
    filters:
      users.country: USA,United States
    sorts: [users.gender 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: looker_2026
      palette_id: looker_2026_categorical_1
      options:
        steps: 5
        reverse: false
        mirror: false
    hidden_fields: []
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Age Tier
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    font_size: 12
    point_style: none
    series_labels: {}
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    table_theme: modern
    modern2026: true
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_points_if_no: []
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_pivots: {}
    listen:
      Created Date: order_items.created_date
    row: 63
    col: 28
    width: 17
    height: 9
    tab_name: ''
  - title: Users by Days as Customer
    name: Users by Days as Customer
    model: full_ecommerce_demo
    explore: order_items
    type: looker_pie
    fields: [user_order_facts.days_as_customer_tiered, users.count]
    filters:
      users.country: USA,United States
    sorts: [user_order_facts.days_as_customer_tiered]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Days as Customer (Tiered)
    y_axes: [{label: Users, orientation: left, series: [{id: users.count, name: Users,
            axisId: users.count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    hide_legend: false
    font_size: '12'
    series_colors: {}
    hidden_fields: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: order_items.created_date
    row: 54
    col: 45
    width: 27
    height: 18
    tab_name: ''
  - title: Users by Age
    name: Users by Age
    model: full_ecommerce_demo
    explore: order_items
    type: looker_pie
    fields: [users.count, users.age_tier]
    filters:
      users.country: USA,United States
    sorts: [users.age_tier]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: looker_2026
      palette_id: looker_2026_categorical_1
      options:
        steps: 5
        reverse: false
        mirror: false
    hidden_fields: []
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{showLabels: true, label: "# of Users", showValues: false}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Age Tier
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    font_size: '12'
    point_style: none
    series_labels: {}
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    table_theme: modern
    modern2026: true
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_points_if_no: []
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_pivots: {}
    listen:
      Created Date: order_items.created_date
    row: 54
    col: 0
    width: 28
    height: 11
    tab_name: ''
  - title: How Many Users are Repeat Customers?
    name: How Many Users are Repeat Customers?
    model: full_ecommerce_demo
    explore: order_items
    type: looker_pie
    fields: [user_order_facts.repeat_customer, users.count, repeat_customer]
    filters:
      users.country: USA,United States
    sorts: [repeat_customer desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Repeat Customer?
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: repeat_customer
      args:
      - user_order_facts.repeat_customer
      - - label: Repeat Customer
          filter: 'Yes'
      - Non-Repeat Customer
      _kind_hint: dimension
      _type_hint: string
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: looker_2026
      palette_id: looker_2026_categorical_1
      options:
        steps: 5
        reverse: false
        mirror: false
    hidden_fields: [user_order_facts.repeat_customer]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Users, orientation: left, series: [{id: users.count, name: Users,
            axisId: users.count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Repeat Customer?
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hide_legend: false
    legend_position: left
    font_size: '12'
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    table_theme: modern
    modern2026: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: order_items.created_date
    row: 65
    col: 0
    width: 28
    height: 7
    tab_name: ''
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 12 month ago for 12 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
