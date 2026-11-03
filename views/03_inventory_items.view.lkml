view: inventory_items {
  sql_table_name: bigquery-public-data.thelook_ecommerce.inventory_items ;;

  ## DIMENSIONS ##

  dimension: id {
    primary_key: yes
    type: number
    description: "Unique ID of the inventory item"
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    description: "Cost of the inventory item"
    value_format_name: usd
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created {
    type: time
    description: "Timestamp when the inventory item was created"
    timeframes: [time, date, week, month, raw]
    sql: CAST(${TABLE}.created_at AS TIMESTAMP) ;;
  }

  dimension: product_id {
    type: number
    hidden: yes
    description: "Product ID of the inventory item"
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
    type: time
    description: "Timestamp when the inventory item was sold"
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.sold_at ;;
  }

  dimension: is_sold {
    type: yesno
    description: "Whether the inventory item has been sold"
    sql: ${sold_raw} is not null ;;
  }

  dimension: days_in_inventory {
    description: "days between created and sold date"
    type: number
    sql: TIMESTAMP_DIFF(coalesce(${sold_raw}, CURRENT_TIMESTAMP()), ${created_raw}, DAY) ;;
  }

  dimension: days_in_inventory_tier {
    type: tier
    description: "Tiered bucket for days in inventory"
    sql: ${days_in_inventory} ;;
    style: integer
    tiers: [0, 5, 10, 20, 40, 80, 160, 360]
  }

  dimension: days_since_arrival {
    description: "days since created - useful when filtering on sold yesno for items still in inventory"
    type: number
    sql: TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), ${created_raw}, DAY) ;;
  }

  dimension: days_since_arrival_tier {
    type: tier
    description: "Tiered bucket for days since arrival"
    sql: ${days_since_arrival} ;;
    style: integer
    tiers: [0, 5, 10, 20, 40, 80, 160, 360]
  }

  dimension: product_distribution_center_id {
    hidden: yes
    description: "Distribution center ID for the product"
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  ## MEASURES ##

  measure: sold_count {
    type: count
    description: "Count of sold inventory items"
    drill_fields: [detail*]

    filters: {
      field: is_sold
      value: "Yes"
    }
  }

  measure: sold_percent {
    type: number
    description: "Percentage of inventory items sold"
    value_format_name: percent_2
    sql: 1.0 * ${sold_count}/(CASE WHEN ${count} = 0 THEN NULL ELSE ${count} END) ;;
  }

  measure: total_cost {
    type: sum
    description: "Total cost of inventory items"
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    description: "Average cost of inventory items"
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: count {
    type: count
    description: "Total count of inventory items"
    drill_fields: [detail*]
  }

  measure: number_on_hand {
    type: count
    description: "Count of unsold inventory items on hand"
    drill_fields: [detail*]

    filters: {
      field: is_sold
      value: "No"
    }
  }

  measure: stock_coverage_ratio {
    type: number
    description: "Stock on Hand vs Trailing 28d Sales Ratio"
    sql: 1.0 * ${number_on_hand} / nullif(${order_items.count_last_28d}*20.0,0) ;;
    value_format_name: decimal_2
  }

  set: detail {
    fields: [id, products.item_name, products.category, products.brand, products.department, cost, created_time, sold_time]
  }
}
