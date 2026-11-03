connection: "default_bigquery_connection"

include: "/views/01_order_items.view.lkml"
include: "/views/02_users.view.lkml"
include: "/views/03_inventory_items.view.lkml"
include: "/views/04_products.view.lkml"
include: "/views/05_distribution_centers.view.lkml"
include: "/views/11_order_facts.view.lkml"
include: "/views/12_user_order_facts.view.lkml"
include: "/views/13_repeat_purchase_facts.view.lkml"
include: "/views/51_events.view.lkml"
include: "/views/52_sessions.view.lkml"
include: "/dashboards/customer_lookup.dashboard.lookml"
include: "/dashboards/shipping_logistics_overview.dashboard.lookml"
include: "/dashboards/brand_lookup.dashboard.lookml"
include: "/dashboards/business_pulse.dashboard.lookml"
include: "/dashboards/web_analytics_overview.dashboard.lookml"
include: "/dashboards/us_sales_regional_performance.dashboard.lookml"

############ Model Configuration #############

datagroup: ecommerce_etl {
  sql_trigger: SELECT max(created_at) FROM bigquery-public-data.thelook_ecommerce.events ;;
  max_cache_age: "24 hours"
}

persist_with: ecommerce_etl

############ Base Explores ##############
label: "Full Ecommerce Demo"

explore: order_items {
  label: "(1) Orders, Items and Users"
  view_name: order_items

  join: order_facts {
    type: left_outer
    view_label: "Orders"
    relationship: many_to_one
    sql_on: ${order_facts.order_id} = ${order_items.order_id} ;;
  }

  join: inventory_items {
    # Left Join only brings in items that have been sold as order_item
    type: full_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }

  join: user_order_facts {
    view_label: "Users"
    type: left_outer
    relationship: many_to_one
    sql_on: ${user_order_facts.user_id} = ${order_items.user_id} ;;
  }

  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }

  join: repeat_purchase_facts {
    relationship: many_to_one
    type: full_outer
    sql_on: ${order_items.order_id} = ${repeat_purchase_facts.order_id} ;;
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    relationship: many_to_one
  }
}

#########  Event Data Explores #########

explore: events {
  label: "(2) Web Event Data"

  join: sessions {
    type: left_outer
    sql_on: ${events.session_id} = ${sessions.session_id} ;;
    relationship: many_to_one
  }

  join: session_landing_page {
    from: events
    type: left_outer
    sql_on: ${sessions.landing_event_id} = ${session_landing_page.event_id} ;;
    fields: [simple_page_info*]
    relationship: one_to_one
  }

  join: session_bounce_page {
    from: events
    type: left_outer
    sql_on: ${sessions.bounce_event_id} = ${session_bounce_page.event_id} ;;
    fields: [simple_page_info*]
    relationship: many_to_one
  }

  join: product_viewed {
    from: products
    type: left_outer
    sql_on: ${events.viewed_product_id} = ${product_viewed.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${sessions.session_user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: user_order_facts {
    type: left_outer
    sql_on: ${users.id} = ${user_order_facts.user_id} ;;
    relationship: one_to_one
    view_label: "Users"
  }
}
