view: users {
  sql_table_name: bigquery-public-data.thelook_ecommerce.users ;;

  ## Demographics ##

  dimension: id {
    primary_key: yes
    type: number
    description: "Unique ID of the user"
    sql: ${TABLE}.id ;;
    tags: ["user_id"]
  }

  dimension: first_name {
    hidden: yes
    description: "First name of the user"
    sql: CONCAT(UPPER(SUBSTR(${TABLE}.first_name,1,1)), LOWER(SUBSTR(${TABLE}.first_name,2))) ;;
  }

  dimension: last_name {
    hidden: yes
    description: "Last name of the user"
    sql: CONCAT(UPPER(SUBSTR(${TABLE}.last_name,1,1)), LOWER(SUBSTR(${TABLE}.last_name,2))) ;;
  }

  dimension: name {
    description: "Full name of the user"
    sql: concat(${first_name}, ' ', ${last_name}) ;;
    link: {
      label: "Customer Lookup Dashboard"
      url: "/dashboards/10?Email={{ users.email._value | encode_uri }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.looker.com"
    }
    required_fields: [email]
  }

  dimension: age {
    type: number
    description: "Age of the user"
    sql: ${TABLE}.age ;;
  }

  dimension: over_21 {
    type: yesno
    description: "Whether the user is over 21 years old"
    sql: ${age} > 21 ;;
  }

  dimension: age_tier {
    type: tier
    description: "Age bucket of the user"
    tiers: [0, 10, 20, 30, 40, 50, 60, 70]
    style: integer
    sql: ${age} ;;
  }

  dimension: gender_short {
    description: "Short gender code (M/F)"
    sql: ${TABLE}.gender ;;
  }

  dimension: gender {
    description: "Gender of the user"
    sql: CASE WHEN ${gender_short} = 'M' THEN 'Male'
              WHEN ${gender_short} = 'F' THEN 'Female'
         END ;;
  }

  dimension: user_image {
    description: "Avatar image of the user"
    sql: ${image_file} ;;
    html: <img src="{{ value }}" width="220" height="220"/> ;;
  }

  dimension: email {
    description: "Email address of the user"
    sql: ${TABLE}.email ;;
    tags: ["email"]

    link: {
      label: "Customer Lookup Dashboard"
      url: "/dashboards/10?Email={{ value | encode_uri }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.looker.com"
    }
    required_fields: [name, first_name]
  }

  dimension: image_file {
    hidden: yes
    description: "URL of the user image file"
    sql: concat('https://docs.looker.com/assets/images/',${gender_short},'.jpg') ;;
  }

  ## Location ##

  dimension: city {
    description: "City of the user"
    sql: ${TABLE}.city ;;
    drill_fields: [zip]
  }

  dimension: state {
    description: "State or region of the user"
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
    drill_fields: [zip, city]
  }

  dimension: zip {
    type: zipcode
    description: "Postal or ZIP code of the user"
    sql: ${TABLE}.postal_code ;;
  }

  dimension: uk_postcode {
    label: "UK Postcode"
    description: "UK Postcode area for UK users"
    sql: case when ${TABLE}.country = 'UK' then regexp_replace(${zip}, '[0-9]', '') else null end ;;
    map_layer_name: uk_postcode_areas
    drill_fields: [city, zip]
  }

  dimension: country {
    description: "Country of the user"
    map_layer_name: countries
    drill_fields: [state, city]
    sql: CASE WHEN ${TABLE}.country = 'UK' THEN 'United Kingdom'
           ELSE ${TABLE}.country
           END
       ;;
  }

  dimension: location {
    type: location
    description: "Exact latitude and longitude coordinates of the user"
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  dimension: approx_latitude {
    type: number
    description: "Approximate latitude rounded to 1 decimal place"
    sql: round(${TABLE}.latitude,1) ;;
  }

  dimension: approx_longitude {
    type: number
    description: "Approximate longitude rounded to 1 decimal place"
    sql: round(${TABLE}.longitude,1) ;;
  }

  dimension: approx_location {
    type: location
    description: "Approximate geographical location of the user"
    drill_fields: [location]
    sql_latitude: ${approx_latitude} ;;
    sql_longitude: ${approx_longitude} ;;
  }

  ## Other User Information ##

  dimension_group: created {
    type: time
    description: "Timestamp when the user account was created"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: history {
    description: "Link to the user's order history"
    sql: ${TABLE}.id ;;
    html: <a href="/explore/full_ecommerce_demo/order_items?fields=order_items.detail*&f[users.id]={{ value }}">Order History</a> ;;
  }

  dimension: traffic_source {
    description: "Marketing traffic source through which the user was acquired"
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: ssn {
    hidden: yes
    type: string
    description: "Dummy random 4 digits for SSN demo"
    sql: CONCAT(CAST(FLOOR(10*RAND()) AS INT64),CAST(FLOOR(10*RAND()) AS INT64),
                CAST(FLOOR(10*RAND()) AS INT64),CAST(FLOOR(10*RAND()) AS INT64)) ;;
  }

  dimension: ssn_last_4 {
    label: "SSN Last 4"
    description: "Only users with sufficient permissions will see this data"
    type: string
    sql: ${ssn} ;;
  }

  ## MEASURES ##

  measure: count {
    type: count
    description: "Total count of users"
    drill_fields: [detail*]
  }

  measure: count_percent_of_total {
    label: "Count (Percent of Total)"
    type: percent_of_total
    description: "User count as a percentage of total users"
    sql: ${count} ;;
    drill_fields: [detail*]
  }

  measure: average_age {
    type: average
    description: "Average age of users"
    value_format_name: decimal_2
    sql: ${age} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [id, name, email, age, created_date]
  }
}
