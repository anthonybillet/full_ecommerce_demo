---
- dashboard: shipping_logistics__operations_overview
  title: Shipping Logistics & Operations Overview
  style: modern
  crossfilter_enabled: true
  description: Shipping and logistics overview for an ecommerce store - showing things
    like how many orders are processing, and where things are shipping
  preferred_slug: r5XevRi7bUwqi8FpAz5uiO
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Order Shipment Status
    name: Order Shipment Status
    model: full_ecommerce_demo
    explore: order_items
    type: looker_column
    fields: [order_items.created_date, order_items.status, order_items.order_count]
    pivots: [order_items.status]
    filters:
      order_items.created_date: 60 days
      order_items.status: Complete,Shipped,Processing
    sorts: [order_items.created_date desc, order_items.status]
    limit: 500
    column_limit: 50
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Distribution Center: distribution_centers.name
    row: 10
    col: 0
    width: 48
    height: 16
    tab_name: ''
  - title: Open Orders >3 Days Old
    name: Open Orders >3 Days Old
    model: full_ecommerce_demo
    explore: order_items
    type: looker_grid
    fields: [order_items.order_id, users.email, order_items.created_date, order_items.status,
      products.item_name, order_items.days_to_process]
    filters:
      order_items.created_date: before 3 days ago
      order_items.status: Processing
    sorts: [order_items.days_to_process desc]
    limit: 25
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
    enable_conditional_formatting: false
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
    series_cell_visualizations:
      order_items.days_to_process:
        is_active: true
        palette:
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab
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
    conditional_formatting: [{type: along a scale..., value: !!null '', fields: [
          order_items.days_to_process], cell_format: {background_color: "#4285F4",
          color_application: {collection_id: looker_2026, palette_id: looker_2026_sequential_1,
            options: {steps: 5, reverse: true}}, font_color: !!null '', font_style: {
            bold: false, italic: false, strikethrough: false}}, id: 0c6c0177-0df0-492d-8c9b-1ace8536cfc6,
        apply_formatting_to_row: false}]
    truncate_column_names: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Distribution Center: distribution_centers.name
    row: 34
    col: 0
    width: 72
    height: 16
    tab_name: ''
  - title: Open Orders - Where do we need to ship?
    name: Open Orders - Where do we need to ship?
    model: full_ecommerce_demo
    explore: order_items
    type: looker_map
    fields: [distribution_centers.location, users.approx_location, order_items.average_days_to_process]
    filters:
      order_items.status: '"Processing"'
      order_items.order_count: ">0"
    sorts: [order_items.average_days_to_process desc]
    limit: 500
    map_plot_mode: lines
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 36.31512514748051
    map_longitude: -92.10937499999999
    map_zoom: 3
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Distribution Center: distribution_centers.name
    row: 70
    col: 0
    width: 39
    height: 16
    tab_name: ''
  - title: Average Shipping Time to Users
    name: Average Shipping Time to Users
    model: full_ecommerce_demo
    explore: order_items
    type: looker_map
    fields: [users.approx_location, order_items.average_shipping_time]
    sorts: [order_items.average_shipping_time desc]
    limit: 5000
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 36.527294814546245
    map_longitude: -92.19726562500001
    map_zoom: 3
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Distribution Center: distribution_centers.name
    row: 54
    col: 39
    width: 33
    height: 32
    tab_name: ''
  - title: Most Common Shipping Locations
    name: Most Common Shipping Locations
    model: full_ecommerce_demo
    explore: order_items
    type: looker_map
    fields: [distribution_centers.location, users.approx_location, order_items.order_count]
    filters:
      order_items.order_count: ">30"
    sorts: [order_items.order_count desc]
    limit: 1000
    map_plot_mode: lines
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 43.58039085560786
    map_longitude: -61.52343749999999
    map_zoom: 3
    map_value_scale_clamp_max: 300
    map_value_scale_clamp_min: 30
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Distribution Center: distribution_centers.name
    row: 54
    col: 0
    width: 39
    height: 16
    tab_name: ''
  - title: Inventory Aging Report
    name: Inventory Aging Report
    model: full_ecommerce_demo
    explore: order_items
    type: looker_column
    fields: [inventory_items.days_in_inventory_tier, inventory_items.count]
    filters:
      inventory_items.is_sold: 'No'
    sorts: [inventory_items.days_in_inventory_tier]
    limit: 500
    column_limit: 50
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
    color_application:
      collection_id: looker_2026
      palette_id: looker_2026_categorical_1
      options:
        steps: 5
        reverse: false
        mirror: false
    hidden_fields: []
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: Unsold inventory only
    listen:
      Distribution Center: distribution_centers.name
    row: 4
    col: 48
    width: 24
    height: 22
    tab_name: ''
  - title: "# Orders Processing"
    name: "# Orders Processing"
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    filters:
      order_items.status: Processing
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
    show_view_names: false
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Distribution Center: distribution_centers.name
    row: 4
    col: 0
    width: 18
    height: 6
    tab_name: ''
  - title: "# Orders Shipped"
    name: "# Orders Shipped"
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    filters:
      order_items.status: Shipped
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
    show_view_names: false
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Distribution Center: distribution_centers.name
    row: 4
    col: 33
    width: 15
    height: 6
    tab_name: ''
  - title: Total Amount Processing
    name: Total Amount Processing
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price]
    filters:
      order_items.status: Processing
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
    smart_single_value_size: false
    value_format: ''
    show_view_names: false
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Distribution Center: distribution_centers.name
    row: 4
    col: 18
    width: 15
    height: 6
    tab_name: ''
  - name: Operations Overview
    type: text
    title_text: Operations Overview
    subtitle_text: How are we doing from a logistics standpoint?
    body_text: ''
    row: 0
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - name: Orders Still Processing
    type: text
    title_text: Orders Still Processing
    subtitle_text: What orders should have been shipped but are still processing?
    body_text: "**Recommended Action** Send order id over slack to follow up on the\
      \ order status, then email the customer to let them know that there is a delay"
    row: 26
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - name: Shipping by Location
    type: text
    title_text: Shipping by Location
    subtitle_text: Where can we improve our shipping time?
    row: 50
    col: 0
    width: 72
    height: 4
    tab_name: ''
  filters:
  - name: Distribution Center
    title: Distribution Center
    type: field_filter
    default_value: Los Angeles CA
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: distribution_centers.name
