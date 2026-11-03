view: sessions {
  derived_table: {
    sql: SELECT
        session_id
        , CAST(MIN(created_at) AS TIMESTAMP) AS session_start
        , CAST(MAX(created_at) AS TIMESTAMP) AS session_end
        , COUNT(*) AS number_of_events_in_session
        , SUM(CASE WHEN lower(event_type) IN ('category','brand', 'department') THEN 1 ELSE NULL END) AS browse_events
        , SUM(CASE WHEN lower(event_type) = 'product' THEN 1 ELSE NULL END) AS product_events
        , SUM(CASE WHEN lower(event_type) = 'cart' THEN 1 ELSE NULL END) AS cart_events
        , SUM(CASE WHEN lower(event_type) = 'purchase' THEN 1 ELSE NULL end) AS purchase_events
        , CAST(MAX(user_id) AS INT64) AS session_user_id
        , MIN(id) AS landing_event_id
        , MAX(id) AS bounce_event_id
      FROM bigquery-public-data.thelook_ecommerce.events
      GROUP BY session_id
       ;;
  }

  #####  Basic Web Info  ########

  dimension: session_id {
    type: string
    primary_key: yes
    description: "Unique identifier of the web session"
    tags: ["mp_session_id"]
    sql: ${TABLE}.session_id ;;
  }

  measure: count {
    type: count
    description: "Total count of sessions"
    drill_fields: [detail*]
  }

  dimension: session_user_id {
    type: number
    description: "User ID associated with the session"
    tags: ["mp_session_uuid"]
    sql: ${TABLE}.session_user_id ;;
  }

  dimension: landing_event_id {
    type: number
    description: "Event ID of the first event in the session"
    sql: ${TABLE}.landing_event_id ;;
  }

  dimension: bounce_event_id {
    type: number
    description: "Event ID of the last event in the session"
    sql: ${TABLE}.bounce_event_id ;;
  }

  dimension_group: session_start {
    type: time
    description: "Timestamp when the session started"
    timeframes: [raw, time, date, week, month, quarter, year, hour_of_day, day_of_week]
    sql: ${TABLE}.session_start ;;
  }

  dimension_group: session_end {
    type: time
    description: "Timestamp when the session ended"
    timeframes: [raw, time, date, week, month]
    sql: ${TABLE}.session_end ;;
  }

  dimension: duration {
    label: "Duration (sec)"
    type: number
    description: "Duration of the session in seconds"
    sql: (UNIX_MICROS(${TABLE}.session_end) - UNIX_MICROS(${TABLE}.session_start))/1000000 ;;
  }

  measure: average_duration {
    label: "Average Duration (sec)"
    type: average
    description: "Average session duration in seconds"
    value_format_name: decimal_2
    sql: ${duration} ;;
  }

  dimension: duration_seconds_tier {
    label: "Duration Tier (sec)"
    type: tier
    description: "Tiered bucket of session duration in seconds"
    tiers: [10, 30, 60, 120, 300]
    style: integer
    sql: ${duration} ;;
  }

  #####  Bounce Information  ########

  dimension: is_bounce_session {
    type: yesno
    description: "Indicates if the session had only a single event"
    sql: ${number_of_events_in_session} = 1 ;;
  }

  measure: count_bounce_sessions {
    type: count
    description: "Count of single-event bounce sessions"
    filters: {
      field: is_bounce_session
      value: "Yes"
    }
    drill_fields: [detail*]
  }

  measure: percent_bounce_sessions {
    type: number
    description: "Percentage of sessions that bounced"
    value_format_name: percent_2
    sql: 1.0 * ${count_bounce_sessions} / nullif(${count},0) ;;
  }

  ####### Session by event types included  ########

  dimension: number_of_browse_events_in_session {
    type: number
    hidden: yes
    description: "Number of browse events in the session"
    sql: ${TABLE}.browse_events ;;
  }

  dimension: number_of_product_events_in_session {
    type: number
    hidden: yes
    description: "Number of product view events in the session"
    sql: ${TABLE}.product_events ;;
  }

  dimension: number_of_cart_events_in_session {
    type: number
    hidden: yes
    description: "Number of cart events in the session"
    sql: ${TABLE}.cart_events ;;
  }

  dimension: number_of_purchase_events_in_session {
    type: number
    hidden: yes
    description: "Number of purchase events in the session"
    sql: ${TABLE}.purchase_events ;;
  }

  dimension: includes_browse {
    type: yesno
    description: "Whether the session includes at least one browse event"
    sql: ${number_of_browse_events_in_session} > 0 ;;
  }

  dimension: includes_product {
    type: yesno
    description: "Whether the session includes at least one product event"
    sql: ${number_of_product_events_in_session} > 0 ;;
  }

  dimension: includes_cart {
    type: yesno
    description: "Whether the session includes at least one cart event"
    sql: ${number_of_cart_events_in_session} > 0 ;;
  }

  dimension: includes_purchase {
    type: yesno
    description: "Whether the session includes at least one purchase event"
    sql: ${number_of_purchase_events_in_session} > 0 ;;
  }

  measure: count_with_cart {
    type: count
    description: "Count of sessions that included adding to cart"
    filters: {
      field: includes_cart
      value: "Yes"
    }
    drill_fields: [detail*]
  }

  measure: count_with_purchase {
    type: count
    description: "Count of sessions that included a purchase"
    filters: {
      field: includes_purchase
      value: "Yes"
    }
    drill_fields: [detail*]
  }

  dimension: number_of_events_in_session {
    type: number
    description: "Total number of events in the session"
    sql: ${TABLE}.number_of_events_in_session ;;
  }

  ####### Linear Funnel   ########

  dimension: furthest_funnel_step {
    description: "Furthest step reached in the conversion funnel during the session"
    sql: CASE
      WHEN ${number_of_purchase_events_in_session} > 0 THEN '(5) Purchase'
      WHEN ${number_of_cart_events_in_session} > 0 THEN '(4) Add to Cart'
      WHEN ${number_of_product_events_in_session} > 0 THEN '(3) View Product'
      WHEN ${number_of_browse_events_in_session} > 0 THEN '(2) Browse'
      ELSE '(1) Land'
      END
       ;;
  }

  measure: all_sessions {
    view_label: "Funnel View"
    label: "(1) All Sessions"
    type: count
    description: "Total count of all sessions"
    drill_fields: [detail*]
  }

  measure: count_browse_or_later {
    view_label: "Funnel View"
    label: "(2) Browse or later"
    type: count
    description: "Sessions reaching Browse or later funnel step"
    filters: {
      field: furthest_funnel_step
      value: "(2) Browse,(3) View Product,(4) Add to Cart,(5) Purchase"
    }
    drill_fields: [detail*]
  }

  measure: count_product_or_later {
    view_label: "Funnel View"
    label: "(3) View Product or later"
    type: count
    description: "Sessions reaching View Product or later funnel step"
    filters: {
      field: furthest_funnel_step
      value: "(3) View Product,(4) Add to Cart,(5) Purchase"
    }
    drill_fields: [detail*]
  }

  measure: count_cart_or_later {
    view_label: "Funnel View"
    label: "(4) Add to Cart or later"
    type: count
    description: "Sessions reaching Add to Cart or later funnel step"
    filters: {
      field: furthest_funnel_step
      value: "(4) Add to Cart,(5) Purchase"
    }
    drill_fields: [detail*]
  }

  measure: count_purchase {
    view_label: "Funnel View"
    label: "(5) Purchase"
    type: count
    description: "Sessions reaching the Purchase funnel step"
    filters: {
      field: furthest_funnel_step
      value: "(5) Purchase"
    }
    drill_fields: [detail*]
  }

  measure: cart_to_checkout_conversion {
    view_label: "Funnel View"
    type: number
    description: "Conversion rate from cart to purchase"
    value_format_name: percent_2
    sql: 1.0 * ${count_purchase} / nullif(${count_cart_or_later},0) ;;
  }

  measure: overall_conversion {
    view_label: "Funnel View"
    type: number
    description: "Overall session to purchase conversion rate"
    value_format_name: percent_2
    sql: 1.0 * ${count_purchase} / nullif(${count},0) ;;
  }

  set: detail {
    fields: [session_id, session_start_time, session_end_time, number_of_events_in_session, duration, number_of_purchase_events_in_session, number_of_cart_events_in_session]
  }
}
