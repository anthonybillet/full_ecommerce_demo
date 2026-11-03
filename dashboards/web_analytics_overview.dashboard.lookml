---
- dashboard: web_analytics_overview
  title: Web Analytics Overview
  style: modern
  description: ''
  preferred_slug: lN0TVhCgMW8UW1yjHb6wxo
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Total Visitors
    name: Total Visitors
    model: full_ecommerce_demo
    explore: events
    type: single_value
    fields: [events.unique_visitors, events.event_week]
    filters:
      events.event_date: 2 weeks ago for 2 weeks
    sorts: [events.event_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "${events.unique_visitors}-offset(${events.unique_visitors},1)"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: medium
    value_format: ''
    comparison_label: Weekly Change
    single_value_title: Visitors Past Week
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      Browser: events.browser
      Traffic Source: users.traffic_source
    row: 0
    col: 0
    width: 18
    height: 8
    tab_name: ''
  - title: Total Converted Visitors
    name: Total Converted Visitors
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [users.count]
    sorts: [users.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: medium
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Traffic Source: users.traffic_source
      Date: order_items.created_date
    row: 0
    col: 33
    width: 15
    height: 8
    tab_name: ''
  - title: Total Profit
    name: Total Profit
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: medium
    value_format: "$#,###"
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: ''
    listen:
      Traffic Source: users.traffic_source
      Date: order_items.created_date
    row: 0
    col: 18
    width: 15
    height: 8
    tab_name: ''
  - title: Visits by Browser
    name: Visits by Browser
    model: full_ecommerce_demo
    explore: events
    type: looker_pie
    fields: [events.browser, events.count]
    sorts: [events.count desc]
    limit: 50
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    start_angle: 0
    end_angle: 0
    show_null_labels: false
    show_view_names: true
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Browser: events.browser
      Traffic Source: users.traffic_source
      Date: events.event_date
    row: 22
    col: 48
    width: 24
    height: 16
    tab_name: ''
  - title: How Many Seconds do Visitors Spend on Website?
    name: How Many Seconds do Visitors Spend on Website?
    model: full_ecommerce_demo
    explore: events
    type: looker_bar
    fields: [sessions.duration_seconds_tier, sessions.count]
    sorts: [sessions.duration_seconds_tier]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    color_application:
      collection_id: looker_2026
      palette_id: looker_2026_categorical_1
      options:
        steps: 5
        reverse: false
        mirror: false
    hidden_fields: []
    y_axis_labels: [Number of Sessions]
    x_axis_label: Session Duration in Seconds
    x_axis_zoom: true
    y_axis_zoom: true
    x_axis_label_rotation: -45
    show_dropoff: false
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Browser: events.browser
      Traffic Source: users.traffic_source
      Date: events.event_date
    row: 8
    col: 42
    width: 30
    height: 14
    tab_name: ''
  - title: Bounce Rate by Page
    name: Bounce Rate by Page
    model: full_ecommerce_demo
    explore: events
    type: looker_column
    fields: [events.event_type, events.bounce_rate, sessions.count]
    filters:
      events.event_type: "-Purchase,-Login,-Register,-History,-Cancel,-Return"
      sessions.session_start_date: 7 days
    sorts: [sessions.count desc]
    limit: 10
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
    show_value_labels: false
    label_density: 10
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types:
      events.bounce_rate: line
    series_labels:
      events.bounce_rate: Bounce Rate by Page
      events.count: Number of Page Views
    y_axis_orientation: [left, right]
    show_null_points: true
    interpolation: linear
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Browser: events.browser
      Traffic Source: users.traffic_source
      Date: events.event_date
    row: 38
    col: 0
    width: 36
    height: 14
    tab_name: ''
  - title: App Overview
    name: App Overview
    model: full_ecommerce_demo
    explore: events
    type: looker_grid
    fields: [product_viewed.brand, events.count, events.unique_visitors, sessions.count_purchase,
      sessions.cart_to_checkout_conversion]
    filters:
      product_viewed.brand: "-NULL"
    sorts: [events.count desc]
    limit: 10
    column_limit: 50
    show_view_names: false
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
      events.count: Total Pageviews
    series_cell_visualizations:
      events.count:
        is_active: true
      events.unique_visitors:
        is_active: true
      sessions.count_purchase:
        is_active: true
      sessions.cart_to_checkout_conversion:
        is_active: false
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
    conditional_formatting: [{apply_formatting_to_row: false, cell_format: {background_color: !!null '',
          color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
            options: {mirror: false, reverse: false, stepped: false}, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
          font_color: !!null '', font_style: {bold: false, italic: false, strikethrough: false}},
        fields: [sessions.cart_to_checkout_conversion], id: d7a24f66-1ebb-4e16-ad25-0a879f6bddd1,
        row_format: {background_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
            options: {mirror: false, reverse: false, stepped: false}, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
          font_color: !!null '', font_style: {bold: false, italic: false, strikethrough: false}},
        type: along a scale..., value: !!null '', apply_to: selectFields, stringValue: ''}]
    defaults_version: 1
    listen:
      Browser: events.browser
      Traffic Source: users.traffic_source
      Date: events.event_date
    row: 38
    col: 36
    width: 36
    height: 14
    tab_name: ''
  - title: eCommerce Funnel
    name: eCommerce Funnel
    model: full_ecommerce_demo
    explore: events
    type: looker_column
    fields: [sessions.all_sessions, sessions.count_browse_or_later, sessions.count_product_or_later,
      sessions.count_cart_or_later, sessions.count_purchase]
    sorts: [sessions.all_sessions desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: ''
    show_dropoff: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: true
    rightAxisLabel: Sessions
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    show_null_points: true
    interpolation: linear
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Browser: events.browser
      Traffic Source: users.traffic_source
      Date: sessions.session_start_date
    row: 8
    col: 0
    width: 42
    height: 14
    tab_name: ''
  - title: Global Events
    name: Global Events
    model: full_ecommerce_demo
    explore: events
    type: looker_google_map
    fields: [events.count, users.approx_location]
    sorts: [events.count desc]
    limit: 1000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle_and_icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_radius_max: 10
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    map_marker_color: ["#4285F4"]
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
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
    map_scale_indicator: 'off'
    map: world
    map_projection: ''
    quantize_colors: false
    colors: [whitesmoke, "#053482"]
    outer_border_color: grey
    inner_border_color: lightgrey
    table_theme: modern
    modern2026: true
    defaults_version: 0
    listen:
      Browser: events.browser
      Traffic Source: users.traffic_source
      Date: events.event_date
    row: 22
    col: 0
    width: 48
    height: 16
    tab_name: ''
  - title: Daily Session and User Count
    name: Daily Session and User Count
    model: full_ecommerce_demo
    explore: events
    type: looker_line
    fields: [sessions.session_start_date, sessions.count, sessions.overall_conversion]
    sorts: [sessions.session_start_date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
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
    show_null_points: true
    interpolation: monotone
    hide_legend: false
    y_axis_orientation: [left, right]
    discontinuous_nulls: false
    show_row_numbers: true
    ordering: none
    show_null_labels: false
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Browser: events.browser
      Traffic Source: users.traffic_source
      Date: events.event_date
    row: 52
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Percent Purchasing Sessions
    name: Percent Purchasing Sessions
    model: full_ecommerce_demo
    explore: events
    type: looker_pie
    fields: [sessions.includes_purchase, sessions.count]
    filters:
      sessions.session_start_date: 7 days
    sorts: [sessions.count desc, sessions.includes_purchase]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    show_view_names: true
    show_row_numbers: true
    ordering: none
    show_null_labels: false
    stacking: normal
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
    x_axis_scale: ordinal
    point_style: circle_outline
    interpolation: linear
    discontinuous_nulls: false
    show_null_points: true
    inner_radius: 50
    series_labels:
      'No': No Purchase
      'Yes': Results in Purchase
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Percent of unique visits that result in a purchase
    listen:
      Browser: events.browser
      Traffic Source: users.traffic_source
      Date: events.event_date
    row: 0
    col: 48
    width: 24
    height: 8
    tab_name: ''
  filters:
  - name: Browser
    title: Browser
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: full_ecommerce_demo
    explore: events
    listens_to_filters: []
    field: events.browser
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
    explore: events
    listens_to_filters: []
    field: users.traffic_source
  - name: Date
    title: Date
    type: date_filter
    default_value: 2 weeks
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
