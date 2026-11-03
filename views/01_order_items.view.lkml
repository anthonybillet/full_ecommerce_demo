view: order_items {
  sql_table_name: bigquery-public-data.thelook_ecommerce.order_items ;;

  ########## IDs, Foreign Keys, Counts ###########

  dimension: id {
    primary_key: yes
    type: number
    description: "Unique ID of the order item"
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    hidden: yes
    description: "Inventory item ID associated with the order item"
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    description: "User ID of the customer who placed the order"
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    description: "Total count of order items"
    drill_fields: [detail*]
  }

  measure: count_last_28d {
    label: "Count Sold in Trailing 28 Days"
    type: count_distinct
    description: "Count of distinct order items sold in the trailing 28 days"
    sql: ${id} ;;
    hidden: yes
    filters: {
      field: created_date
      value: "28 days"
    }
  }

  measure: order_count {
    view_label: "Orders"
    type: count_distinct
    description: "Count of distinct orders"
    drill_fields: [detail*]
    sql: ${order_id} ;;
  }

  measure: first_purchase_count {
    view_label: "Orders"
    type: count_distinct
    description: "Count of distinct orders that represent a user's first purchase"
    sql: ${order_id} ;;
    filters: {
      field: order_facts.is_first_purchase
      value: "Yes"
    }
    drill_fields: [user_id, users.name, users.email, order_id, created_date, users.traffic_source]
  }

  dimension: order_id_no_actions {
    type: number
    hidden: yes
    description: "Order ID without action links"
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_id {
    type: number
    description: "ID of the order"
    sql: ${TABLE}.order_id ;;
  }

  ########## Time Dimensions ##########

  dimension_group: returned {
    type: time
    description: "Timestamp when the item was returned"
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.returned_at ;;
  }

  dimension_group: shipped {
    type: time
    description: "Timestamp when the item was shipped"
    timeframes: [date, week, month, raw]
    sql: CAST(${TABLE}.shipped_at AS TIMESTAMP) ;;
  }

  dimension_group: delivered {
    type: time
    description: "Timestamp when the item was delivered"
    timeframes: [date, week, month, raw]
    sql: CAST(${TABLE}.delivered_at AS TIMESTAMP) ;;
  }

  dimension_group: created {
    type: time
    description: "Timestamp when the order was created"
    timeframes: [time, hour, date, week, month, year, hour_of_day, day_of_week, month_num, raw, week_of_year, month_name]
    sql: ${TABLE}.created_at ;;
  }

  dimension: reporting_period {
    group_label: "Order Date"
    description: "Compares This Year to Date vs Last Year to Date"
    sql: CASE
        WHEN EXTRACT(YEAR from ${created_raw}) = EXTRACT(YEAR from CURRENT_TIMESTAMP())
        AND ${created_raw} < CURRENT_TIMESTAMP()
        THEN 'This Year to Date'

        WHEN EXTRACT(YEAR from ${created_raw}) + 1 = EXTRACT(YEAR from CURRENT_TIMESTAMP())
        AND CAST(FORMAT_TIMESTAMP('%j', ${created_raw}) AS INT64) <= CAST(FORMAT_TIMESTAMP('%j', CURRENT_TIMESTAMP()) AS INT64)
        THEN 'Last Year to Date'

      END
       ;;
  }

  dimension: days_since_sold {
    hidden: yes
    description: "Number of days since the order was created"
    sql: TIMESTAMP_DIFF(${created_raw}, CURRENT_TIMESTAMP(), DAY) ;;
  }

  dimension: months_since_signup {
    view_label: "Orders"
    type: number
    description: "Months elapsed between user signup and order creation"
    sql: CAST(FLOOR(TIMESTAMP_DIFF(${created_raw}, ${users.created_raw}, DAY)/30) AS INT64) ;;
  }

  ########## Logistics ##########

  dimension: status {
    description: "Current fulfillment status of the order item"
    sql: ${TABLE}.status ;;
  }

  dimension: days_to_process {
    type: number
    description: "Days taken to process the order before shipping"
    sql: CASE
        WHEN ${status} = 'Processing' THEN TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), ${created_raw}, DAY)*1.0
        WHEN ${status} IN ('Shipped', 'Complete', 'Returned') THEN TIMESTAMP_DIFF(${shipped_raw}, ${created_raw}, DAY)*1.0
        WHEN ${status} = 'Cancelled' THEN NULL
      END
       ;;
  }

  dimension: shipping_time {
    type: number
    description: "Days between shipped date and delivered date"
    sql: TIMESTAMP_DIFF(${delivered_raw}, ${shipped_raw}, DAY)*1.0 ;;
  }

  measure: average_days_to_process {
    type: average
    description: "Average number of days to process an order"
    value_format_name: decimal_2
    sql: ${days_to_process} ;;
  }

  measure: average_shipping_time {
    type: average
    description: "Average shipping transit time in days"
    value_format_name: decimal_2
    sql: ${shipping_time} ;;
  }

  ########## Financial Information ##########

  dimension: sale_price {
    type: number
    description: "Sale price of the order item"
    value_format_name: usd
    sql: ${TABLE}.sale_price ;;
  }

  dimension: gross_margin {
    type: number
    description: "Gross margin (sale price minus inventory cost)"
    value_format_name: usd
    sql: ${sale_price} - ${inventory_items.cost} ;;
  }

  dimension: item_gross_margin_percentage {
    type: number
    description: "Gross margin as a percentage of sale price"
    value_format_name: percent_2
    sql: 1.0 * ${gross_margin}/nullif(${sale_price}, 0) ;;
  }

  dimension: item_gross_margin_percentage_tier {
    type: tier
    description: "Tiered bucket of item gross margin percentage"
    sql: 100*${item_gross_margin_percentage} ;;
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
    style: interval
  }

  measure: total_sale_price {
    type: sum
    description: "Total revenue from item sales"
    value_format_name: usd
    sql: ${sale_price} ;;
    drill_fields: [detail*]
  }

  measure: total_gross_margin {
    type: sum
    description: "Total gross margin across sold items"
    value_format_name: usd
    sql: ${gross_margin} ;;
    drill_fields: [detail*]
  }

  measure: average_sale_price {
    type: average
    description: "Average sale price per item"
    value_format_name: usd
    sql: ${sale_price} ;;
    drill_fields: [detail*]
  }

  measure: median_sale_price {
    type: median
    description: "Median sale price per item"
    value_format_name: usd
    sql: ${sale_price} ;;
    drill_fields: [detail*]
  }

  measure: average_gross_margin {
    type: average
    description: "Average gross margin per item"
    value_format_name: usd
    sql: ${gross_margin} ;;
    drill_fields: [detail*]
  }

  measure: total_gross_margin_percentage {
    type: number
    description: "Total gross margin as a percentage of total sales"
    value_format_name: percent_2
    sql: 1.0 * ${total_gross_margin}/ nullif(${total_sale_price},0) ;;
  }

  measure: average_spend_per_user {
    type: number
    description: "Average total sale price per distinct user"
    value_format_name: usd
    sql: 1.0 * ${total_sale_price} / nullif(${users.count},0) ;;
    drill_fields: [detail*]
  }

  ########## Return Information ##########

  dimension: is_returned {
    type: yesno
    description: "Indicates whether the item was returned"
    sql: ${returned_raw} IS NOT NULL ;;
  }

  measure: returned_count {
    type: count_distinct
    description: "Count of returned order items"
    sql: ${id} ;;
    filters: {
      field: is_returned
      value: "yes"
    }
    drill_fields: [detail*]
  }

  measure: returned_total_sale_price {
    type: sum
    description: "Total sale price of returned items"
    value_format_name: usd
    sql: ${sale_price} ;;
    filters: {
      field: is_returned
      value: "yes"
    }
  }

  measure: return_rate {
    type: number
    description: "Percentage of order items that were returned"
    value_format_name: percent_2
    sql: 1.0 * ${returned_count} / nullif(${count},0) ;;
  }

  ########## Repeat Purchase Facts ##########

  dimension: days_until_next_order {
    type: number
    view_label: "Repeat Purchase Facts"
    description: "Days between this order and the customer's next order"
    sql: TIMESTAMP_DIFF(${repeat_purchase_facts.next_order_raw}, ${created_raw}, DAY) ;;
  }

  dimension: repeat_orders_within_30d {
    type: yesno
    view_label: "Repeat Purchase Facts"
    description: "Indicates if the customer placed another order within 30 days"
    sql: ${days_until_next_order} <= 30 ;;
  }

  dimension: repeat_orders_within_15d {
    type: yesno
    description: "Indicates if the customer placed another order within 15 days"
    sql: ${days_until_next_order} <= 15 ;;
  }

  measure: count_with_repeat_purchase_within_30d {
    type: count_distinct
    description: "Count of order items followed by a repeat purchase within 30 days"
    sql: ${id} ;;
    view_label: "Repeat Purchase Facts"

    filters: {
      field: repeat_orders_within_30d
      value: "Yes"
    }
  }

  measure: 30_day_repeat_purchase_rate {
    description: "The percentage of customers who purchase again within 30 days"
    view_label: "Repeat Purchase Facts"
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${count_with_repeat_purchase_within_30d} / (CASE WHEN ${count} = 0 THEN NULL ELSE ${count} END) ;;
    drill_fields: [products.brand, order_count, count_with_repeat_purchase_within_30d]
  }

  ########## Sets ##########

  set: detail {
    fields: [id, order_id, status, created_date, sale_price, products.brand, products.item_name, users.user_image, users.name, users.email]
  }
  set: return_detail {
    fields: [id, order_id, status, created_date, returned_date, sale_price, products.brand, products.item_name, users.user_image, users.name, users.email]
  }
}
