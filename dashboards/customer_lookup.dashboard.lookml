---
- dashboard: customer_lookup
  title: Customer Lookup
  style: modern
  crossfilter_enabled: true
  description: ''
  preferred_slug: LwF4kmrnBXomDWRqzpVHMO
  theme_name: ''
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: User Info
    name: User Info
    model: full_ecommerce_demo
    explore: order_items
    type: looker_single_record
    fields: [users.id, users.email, users.name, users.traffic_source, users.created_month,
      users.age, users.gender, users.city, users.state, users.zip]
    filters:
      order_items.created_date: 99 years
      users.id: ''
    sorts: [users.zip desc]
    limit: 1
    column_limit: 50
    show_view_names: false
    show_null_labels: false
    show_row_numbers: true
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Email: users.email
    row: 0
    col: 0
    width: 7
    height: 5
    tab_name: ''
  - title: Lifetime Orders
    name: Lifetime Orders
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    filters:
      order_items.created_date: 99 years
      users.id: ''
    sorts: [order_items.order_count desc]
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
    show_null_labels: false
    user_access_filters: {}
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Email: users.email
    row: 7
    col: 0
    width: 7
    height: 2
    tab_name: ''
  - title: Total Items Returned
    name: Total Items Returned
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.count]
    filters:
      order_items.returned_date: NOT NULL
    sorts: [order_items.count desc]
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
    show_null_labels: false
    font_size: medium
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Email: users.email
    row: 5
    col: 0
    width: 7
    height: 2
    tab_name: ''
  - title: Items Order History
    name: Items Order History
    model: full_ecommerce_demo
    explore: order_items
    type: looker_grid
    fields: [order_items.id, products.item_name, order_items.status, order_items.created_date,
      order_items.shipped_date, order_items.delivered_date, order_items.returned_date,
      distribution_centers.name]
    sorts: [order_items.created_date desc]
    limit: 500
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
    hidden_fields: []
    y_axes: []
    modern2026: true
    defaults_version: 1
    listen:
      Email: users.email
    row: 9
    col: 0
    width: 16
    height: 5
    tab_name: ''
  - title: Favorite Categories
    name: Favorite Categories
    model: full_ecommerce_demo
    explore: order_items
    type: looker_pie
    fields: [products.category, order_items.count]
    filters:
      order_items.created_date: 99 years
    sorts: [order_items.count desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    series_colors: {}
    show_view_names: false
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Email: users.email
    row: 9
    col: 16
    width: 8
    height: 5
    tab_name: ''
  - title: User Location
    name: User Location
    model: full_ecommerce_demo
    explore: order_items
    type: looker_geo_coordinates
    fields: [users.zip, users.count]
    sorts: [users.zip desc]
    limit: 1
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: true
    point_color: "#4285F4"
    point_radius: 10
    font_size: medium
    text_color: "#49719a"
    map_plot_mode: points
    heatmap_gridlines: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    map_latitude: 42.35930500076174
    map_longitude: -71.02283477783203
    map_zoom: 11
    loading: false
    hidden_fields: []
    y_axes: []
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Email: users.email
    row: 0
    col: 7
    width: 17
    height: 9
    tab_name: ''
  filters:
  - name: Email
    title: Email
    type: field_filter
    default_value: marybaker@example.org
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: users.email
