view: order_facts {
  derived_table: {
    explore_source: order_items {
      column: order_id { field: order_items.order_id_no_actions }
      column: items_in_order { field: order_items.count }
      column: order_amount { field: order_items.total_sale_price }
      column: order_cost { field: inventory_items.total_cost }
      column: user_id { field: order_items.user_id }
      column: created_at { field: order_items.created_raw }
      column: order_gross_margin { field: order_items.total_gross_margin }
      derived_column: order_sequence_number {
        sql: RANK() OVER (PARTITION BY user_id ORDER BY created_at) ;;
      }
    }
  }

  dimension: order_id {
    type: number
    hidden: yes
    primary_key: yes
    description: "Unique order ID"
    sql: ${TABLE}.order_id ;;
  }

  dimension: items_in_order {
    type: number
    description: "Number of items in the order"
    sql: ${TABLE}.items_in_order ;;
  }

  dimension: order_amount {
    type: number
    description: "Total sale amount of the order"
    value_format_name: usd
    sql: ${TABLE}.order_amount ;;
  }

  dimension: order_cost {
    type: number
    description: "Total cost of items in the order"
    value_format_name: usd
    sql: ${TABLE}.order_cost ;;
  }

  dimension: order_gross_margin {
    type: number
    description: "Total gross margin of the order"
    value_format_name: usd
    sql: ${TABLE}.order_gross_margin ;;
  }

  dimension: order_sequence_number {
    type: number
    description: "Sequential order number for the customer"
    sql: ${TABLE}.order_sequence_number ;;
  }

  dimension: is_first_purchase {
    type: yesno
    description: "Indicates whether this order is the customer's first purchase"
    sql: ${order_sequence_number} = 1 ;;
  }
}
