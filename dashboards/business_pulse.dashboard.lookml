---
- dashboard: business_pulse
  title: Business Pulse
  style: modern
  description: ''
  preferred_slug: XGKb6ffUWUnKVR7NWxt6XB
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Number of First Purchasers
    name: Number of First Purchasers
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [users.count]
    filters:
      users.created_date: 7 days
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal
      label: Goal
      expression: '10000'
      value_format:
      value_format_name: decimal_0
      _kind_hint: dimension
      _type_hint: number
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: New Users Acquired
    smart_single_value_size: false
    font_size: medium
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    primary_row: first
    progress_bar_width: compact
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 4
    col: 0
    width: 24
    height: 4
    tab_name: ''
  - title: Average Order Sale Price
    name: Average Order Sale Price
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    sorts: [order_items.average_sale_price desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: date
      label: date
      expression: now()
      value_format:
      value_format_name:
      _kind_hint: dimension
      is_disabled: true
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    font_size: medium
    hidden_fields: []
    y_axes: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: modern
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    modern2026: true
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 8
    col: 0
    width: 24
    height: 4
    tab_name: ''
  - title: Orders by Day and Category
    name: Orders by Day and Category
    model: full_ecommerce_demo
    explore: order_items
    type: looker_area
    fields: [products.category, order_items.count, order_items.created_date]
    pivots: [products.category]
    fill_fields: [order_items.created_date]
    filters:
      products.category: Blazers & Jackets,Sweaters,Pants,Shorts,Fashion Hoodies &
        Sweatshirts,Accessories
    sorts: [products.category, order_items.created_date desc]
    limit: 500
    column_limit: 50
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Number of Orders, orientation: left, series: [{id: Accessories
              - order_items.count, name: Accessories, axisId: order_items.count},
          {id: Blazers & Jackets - order_items.count, name: Blazers &amp; Jackets,
            axisId: order_items.count}, {id: Fashion Hoodies & Sweatshirts - order_items.count,
            name: Fashion Hoodies &amp; Sweatshirts, axisId: order_items.count}, {
            id: Pants - order_items.count, name: Pants, axisId: order_items.count},
          {id: Shorts - order_items.count, name: Shorts, axisId: order_items.count},
          {id: Sweaters - order_items.count, name: Sweaters, axisId: order_items.count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_labels: ["# Order Items"]
    hide_legend: false
    series_colors: {}
    x_axis_datetime_tick_count: 4
    x_axis_datetime: true
    hide_points: true
    hidden_fields: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 12
    col: 0
    width: 48
    height: 12
    tab_name: ''
  - title: Website Visit Volume vs Conversion Rate
    name: Website Visit Volume vs Conversion Rate
    model: full_ecommerce_demo
    explore: events
    type: looker_column
    fields: [events.event_day_of_week, events.sessions_count, events.unique_visitors,
      sessions.overall_conversion]
    sorts: [events.event_day_of_week]
    limit: 500
    column_limit: 50
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: events.unique_visitors,
            name: Unique Visitors}, {id: events.sessions_count, name: Sessions Count}]},
      {label: '', maxValue: !!null '', minValue: !!null '', orientation: right, showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false, valueFormat: !!null '', series: [{id: sessions.overall_conversion,
            name: Conversion Rate}]}]
    series_types:
      events.unique_visitors: line
      events.sessions_count: line
    series_colors: {}
    series_labels:
      sessions.overall_conversion: Conversion Rate
      events.sessions_count: Total Visitors
    y_axis_orientation: [left, right]
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: events.event_date
      Country: users.country
    row: 52
    col: 0
    width: 30
    height: 14
    tab_name: ''
  - title: Percent of Cohort Still Active by Traffic Source
    name: Percent of Cohort Still Active by Traffic Source
    model: full_ecommerce_demo
    explore: order_items
    type: looker_line
    fields: [order_items.months_since_signup, users.count, users.traffic_source]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0, 12]"
      users.created_month: 12 months
    sorts: [order_items.months_since_signup, users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: pct_cohort_still_active
      label: Pct Cohort Still Active
      expression: "${users.count} / max(${users.count})"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: []
    y_axis_max: []
    y_axis_labels: [Percent of Cohort still Active]
    y_axis_value_format: "#%"
    series_colors: {}
    hidden_fields: [users.count]
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 66
    col: 30
    width: 42
    height: 14
    tab_name: ''
  - title: Total Sales, Year over Year
    name: Total Sales, Year over Year
    model: full_ecommerce_demo
    explore: order_items
    type: looker_line
    fields: [order_items.created_month_name, order_items.total_sale_price, order_items.created_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_month_name]
    filters:
      order_items.created_date: before 0 months ago
      order_items.created_year: 4 years
    sorts: [order_items.created_year desc 0, order_items.created_month_name]
    limit: 500
    column_limit: 50
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{id: '2018', name: '2018', axisId: order_items.total_sale_price},
          {id: '2017', name: '2017', axisId: order_items.total_sale_price}, {id: '2016',
            name: '2016', axisId: order_items.total_sale_price}, {id: '2015', name: '2015',
            axisId: order_items.total_sale_price}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear, valueFormat: "$0,\\\
          K\\"}]
    y_axis_value_format: "$#,##0"
    x_axis_label: Month of Year
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 4
    col: 48
    width: 24
    height: 20
    tab_name: ''
  - title: Highest Spending Users
    name: Highest Spending Users
    model: full_ecommerce_demo
    explore: order_items
    type: looker_google_map
    fields: [users.approx_location, users.gender, order_items.total_sale_price, order_items.average_spend_per_user]
    pivots: [users.gender]
    sorts: [users.gender 0, order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: [order_items.total_sale_price]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 37.57941251343841
    map_longitude: -99.31640625000001
    map_zoom: 4
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle_and_icon
    map_marker_icon_name: person
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_radius_max: 15
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    map_marker_color: ["#4285F4", "#ED984D", "#AD7FE6", "#B5C665"]
    show_legend: true
    map_value_colors: [white, purple]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_value_scale_clamp_min: 0
    map_value_scale_clamp_max: 200
    map_scale_indicator: 'off'
    stacking: ''
    show_value_labels: false
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
    loading: false
    map: usa
    map_projection: ''
    quantize_colors: false
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 0
    note_state: collapsed
    note_display: hover
    note_text: Bubble size corresponds to average user spend
    hidden_pivots:
      users.gender___null:
        is_entire_pivot_hidden: false
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 28
    col: 30
    width: 42
    height: 18
    tab_name: ''
  - title: User Behaviors by Traffic Source
    name: User Behaviors by Traffic Source
    model: full_ecommerce_demo
    explore: order_items
    type: looker_column
    fields: [users.traffic_source, order_items.average_sale_price, user_order_facts.average_lifetime_orders]
    sorts: [users.traffic_source]
    limit: 500
    column_limit: 50
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
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{id: order_items.average_sale_price,
            name: Average Sale Price, axisId: order_items.average_sale_price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{id: user_order_facts.average_lifetime_orders,
            name: Average Lifetime Orders, axisId: user_order_facts.average_lifetime_orders}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_labels: [Average Sale Price ($)]
    y_axis_value_format: '0'
    hide_legend: false
    font_size: '13'
    series_colors: {}
    y_axis_orientation: [left, right]
    hidden_fields: []
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 66
    col: 0
    width: 30
    height: 14
    tab_name: ''
  - title: User Basic Demographic Profile
    name: User Basic Demographic Profile
    model: full_ecommerce_demo
    explore: order_items
    type: looker_donut_multiples
    fields: [users.gender, users.traffic_source, order_items.count]
    pivots: [users.traffic_source]
    sorts: [users.traffic_source, order_items.count desc 0]
    limit: 500
    column_limit: 15
    show_value_labels: true
    font_size: 15
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
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 28
    col: 0
    width: 30
    height: 18
    tab_name: ''
  - title: 30 Day Repeat Purchase Rate
    name: 30 Day Repeat Purchase Rate
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate]
    sorts: [order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    single_value_title: Repeat Purchase Rate
    font_size: medium
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: What percent of orders are followed by a repeat purchase by the same
      user within 30 days?
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 4
    col: 24
    width: 24
    height: 4
    tab_name: ''
  - title: Total Order Count
    name: Total Order Count
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.reporting_period, order_items.count]
    filters:
      order_items.reporting_period: "-NULL"
    sorts: [order_items.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_change
      label: Percent Change
      expression: "${order_items.count}/offset(${order_items.count},1) - 1"
      value_format:
      value_format_name: percent_0
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Orders This Year
    smart_single_value_size: false
    comparison_label: vs Same Period Last Year
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [order_items.reporting_period]
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 8
    col: 24
    width: 24
    height: 4
    tab_name: ''
  - name: Customer Demographics
    type: text
    title_text: Customer Demographics
    subtitle_text: Who are our customers?
    row: 24
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Most Viewed Brands Online
    name: Most Viewed Brands Online
    model: full_ecommerce_demo
    explore: events
    type: looker_grid
    fields: [product_viewed.brand, sessions.count, sessions.cart_to_checkout_conversion,
      product_viewed.department]
    pivots: [product_viewed.department]
    filters:
      product_viewed.brand: "-NULL"
    sorts: [sessions.count desc 0, product_viewed.department]
    limit: 10
    column_limit: 50
    row_total: right
    show_view_names: false
    show_row_numbers: false
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
      sessions.cart_to_checkout_conversion: Cart Conversion
    series_column_widths:
      product_viewed.brand: 150
    series_cell_visualizations:
      sessions.count:
        is_active: true
        palette:
          palette_id: looker_2026_sequential_1
          collection_id: looker_2026
    table_show_footer: false
    table_enable_pagination: false
    table_page_size_options: 20, 50, 100
    table_column_hover_highlight_enable: false
    table_show_headers: true
    header_font_bold: false
    header_font_italic: false
    cell_font_weight: ''
    cell_font_style: ''
    cell_text_alignment: ''
    table_custom_border_enable: false
    table_custom_border_width:
    table_custom_border_style: solid
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: looker_2026, palette_id: looker_2026_sequential_1,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [sessions.cart_to_checkout_conversion]}]
    conditional_formatting_ignored_fields: []
    stacking: ''
    show_value_labels: false
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
    truncate_column_names: true
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: events.event_date
      Country: users.country
    row: 52
    col: 30
    width: 42
    height: 14
    tab_name: ''
  - name: Web Analytics
    type: text
    title_text: Web Analytics
    subtitle_text: What are customers doing on our website?
    body_text: "**Recommended Action** Dive into successful brands to see what they're\
      \ doing that's working, drill by category or head to the Brand Analytics report"
    row: 46
    col: 0
    width: 72
    height: 6
    tab_name: ''
  - name: Top Line Metrics
    type: text
    title_text: Top Line Metrics
    subtitle_text: Are we headed in the right direction?
    row: 0
    col: 0
    width: 72
    height: 4
    tab_name: ''
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: [Country]
    field: users.state
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: [State, Country]
    field: users.city
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: users.traffic_source
  - name: User Gender
    title: User Gender
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: users.gender
  - name: Date
    title: Date
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: distribution_centers.location
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: users.country
