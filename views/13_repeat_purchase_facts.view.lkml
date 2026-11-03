view: repeat_purchase_facts {
  derived_table: {
    sql: SELECT
      order_items.order_id as order_id
      , order_items.created_at
      , COUNT(DISTINCT repeat_order_items.id) AS number_subsequent_orders
      , MIN(repeat_order_items.created_at) AS next_order_date
      , MIN(repeat_order_items.order_id) AS next_order_id
    FROM bigquery-public-data.thelook_ecommerce.order_items as order_items
    LEFT JOIN bigquery-public-data.thelook_ecommerce.order_items repeat_order_items
      ON order_items.user_id = repeat_order_items.user_id
      AND order_items.created_at < repeat_order_items.created_at
    GROUP BY 1, 2
     ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    primary_key: yes
    description: "Order ID"
    sql: ${TABLE}.order_id ;;
  }

  dimension: next_order_id {
    type: number
    hidden: yes
    description: "Order ID of the subsequent order"
    sql: ${TABLE}.next_order_id ;;
  }

  dimension: has_subsequent_order {
    type: yesno
    description: "Indicates whether the customer placed a subsequent order"
    sql: ${next_order_id} > 0 ;;
  }

  dimension: number_subsequent_orders {
    type: number
    description: "Count of subsequent order items placed by the customer"
    sql: ${TABLE}.number_subsequent_orders ;;
  }

  dimension_group: next_order {
    type: time
    description: "Timestamp of the next subsequent order"
    timeframes: [raw, date]
    hidden: yes
    sql: CAST(${TABLE}.next_order_date AS TIMESTAMP) ;;
  }
}
