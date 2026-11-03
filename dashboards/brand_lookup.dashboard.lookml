---
- dashboard: brand_lookup
  title: Brand Lookup
  style: modern
  description: ''
  preferred_slug: Q5U5bV2KX4ZtZShdwuX7wM
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Total Orders
    name: Total Orders
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
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
    font_size: medium
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 4
    col: 24
    width: 12
    height: 6
    tab_name: ''
  - title: Total Customers
    name: Total Customers
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
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 4
    col: 0
    width: 12
    height: 6
    tab_name: ''
  - title: Average Order Value
    name: Average Order Value
    model: full_ecommerce_demo
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    sorts: [order_items.average_sale_price desc]
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
    font_size: medium
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 4
    col: 12
    width: 12
    height: 6
    tab_name: ''
  - title: Brand Traffic by Source, Browser
    name: Brand Traffic by Source, Browser
    model: full_ecommerce_demo
    explore: events
    type: looker_donut_multiples
    fields: [users.traffic_source, events.count, events.browser]
    pivots: [users.traffic_source]
    filters:
      users.traffic_source: "-NULL"
    sorts: [events.count desc 1, users.traffic_source]
    limit: 20
    column_limit: 50
    show_value_labels: true
    font_size: 12
    series_colors: {}
    show_view_names: false
    stacking: ''
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      Brand Name: product_viewed.brand
      Date: events.event_date
      State: users.state
    row: 28
    col: 42
    width: 30
    height: 22
    tab_name: ''
  - title: Top Product Categories - Cart vs Conversion
    name: Top Product Categories - Cart vs Conversion
    model: full_ecommerce_demo
    explore: events
    type: looker_column
    fields: [product_viewed.category, sessions.overall_conversion, sessions.cart_to_checkout_conversion,
      sessions.count_cart_or_later]
    filters:
      product_viewed.category: "-NULL"
    sorts: [sessions.count_cart_or_later desc]
    limit: 8
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
    y_axes: [{label: Total Added to Cart, maxValue: !!null '', minValue: !!null '',
        orientation: left, showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
        series: [{id: sessions.count_cart_or_later, name: "(4) Add to Cart or later"}]},
      {label: '', maxValue: !!null '', minValue: !!null '', orientation: right, showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false, valueFormat: !!null '', series: [{id: sessions.overall_conversion,
            name: Overall Conversion}, {id: sessions.cart_to_checkout_conversion,
            name: Cart to Checkout Conversion}]}]
    y_axis_labels: [Cart to Checkout Conversion Percent, Total Added to Cart]
    hide_legend: false
    series_types:
      sessions.cart_to_checkout_conversion: line
      sessions.overall_conversion: line
    series_colors: {}
    series_labels:
      sessions.cart_to_checkout_conversion: Cart to Checkout Conversion
      sessions.overall_conversion: Overall Conversion
      sessions.count_cart_or_later: "# of Add to Cart Events"
    y_axis_orientation: [right, left]
    x_axis_label_rotation: -45
    label_rotation: 0
    show_null_points: true
    interpolation: linear
    table_theme: modern
    modern2026: true
    defaults_version: 1
    listen:
      Brand Name: product_viewed.brand
      Date: events.event_date
      State: users.state
    row: 28
    col: 0
    width: 42
    height: 12
    tab_name: ''
  - title: Top Visitors and Transaction History
    name: Top Visitors and Transaction History
    model: full_ecommerce_demo
    explore: events
    type: looker_grid
    fields: [users.name, users.email, users.state, users.traffic_source, sessions.count]
    filters:
      users.name: "-NULL"
    sorts: [sessions.count desc]
    limit: 15
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
      sessions.count:
        is_active: true
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
    conditional_formatting_ignored_fields: []
    truncate_column_names: false
    defaults_version: 1
    listen:
      Brand Name: product_viewed.brand
      Date: events.event_date
      State: users.state
    row: 56
    col: 36
    width: 36
    height: 16
    tab_name: ''
  - title: Sales and Sale Price Trend
    name: Sales and Sale Price Trend
    model: full_ecommerce_demo
    explore: order_items
    type: looker_line
    fields: [order_items.created_date, order_items.total_sale_price, order_items.average_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 500
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
    y_axis_combined: false
    show_null_points: true
    interpolation: monotone
    y_axis_labels: [Total Sale Amount, Average Selling Price]
    x_axis_label: Order Date
    hide_legend: true
    series_colors: {}
    y_axis_orientation: [left, right]
    x_axis_datetime: true
    hide_points: true
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 4
    col: 36
    width: 36
    height: 20
    tab_name: ''
  - title: Top Purchasers of Brand
    name: Top Purchasers of Brand
    model: full_ecommerce_demo
    explore: order_items
    type: looker_grid
    fields: [users.name, users.email, order_items.count, order_items.total_sale_price,
      users.state]
    sorts: [order_items.count desc]
    limit: 15
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
      order_items.count:
        is_active: true
      order_items.total_sale_price:
        is_active: true
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
    conditional_formatting_ignored_fields: []
    truncate_column_names: false
    defaults_version: 1
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
      State: users.state
    row: 56
    col: 0
    width: 36
    height: 16
    tab_name: ''
  - title: Website Sessions by Hour of Day and User Lifetime Order Tier
    name: Website Sessions by Hour of Day and User Lifetime Order Tier
    model: full_ecommerce_demo
    explore: events
    type: looker_column
    fields: [user_order_facts.lifetime_orders_tier, sessions.count, events.event_hour_of_day]
    pivots: [user_order_facts.lifetime_orders_tier]
    fill_fields: [events.event_hour_of_day]
    sorts: [user_order_facts.lifetime_orders_tier 0, events.event_hour_of_day]
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
    hidden_series: [Undefined]
    series_colors: {}
    series_labels:
      '1': 1 Lifetime Purchase
      1 - 2 - sessions.count: '1'
    show_null_points: true
    interpolation: linear
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: These are order totals by hour of day
    listen:
      Brand Name: product_viewed.brand
      Date: events.event_date
      State: users.state
    row: 40
    col: 0
    width: 42
    height: 10
    tab_name: ''
  - title: Most Popular Categories
    name: Most Popular Categories
    model: full_ecommerce_demo
    explore: order_items
    type: looker_column
    fields: [products.category, products.department, order_items.total_sale_price]
    pivots: [products.department]
    sorts: [products.department 0, order_items.total_sale_price desc 2]
    limit: 500
    column_limit: 50
    row_total: right
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: modern
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    modern2026: true
    defaults_version: 1
    hidden_pivots:
      "$$$_row_total_$$$":
        is_entire_pivot_hidden: true
    row: 10
    col: 0
    width: 36
    height: 14
    tab_name: ''
  - name: Brand Overview
    type: text
    title_text: Brand Overview
    subtitle_text: What are the high level revenue metrics for this brand?
    row: 0
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - name: Web Analytics
    type: text
    title_text: Web Analytics
    subtitle_text: How are users interacting with our website?
    row: 24
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - name: Top Customers
    type: text
    title_text: Top Customers
    subtitle_text: Who are our highest valued customers?
    body_text: "**Recommended Action** Explore from here to see what products a user\
      \ has purchased and include them in a targeted advertising campaign"
    row: 50
    col: 0
    width: 72
    height: 6
    tab_name: ''
  filters:
  - name: Brand Name
    title: Brand Name
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: full_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: products.brand
  - name: Date
    title: Date
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
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
    listens_to_filters: []
    field: users.state
