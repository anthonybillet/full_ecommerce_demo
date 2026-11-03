view: products {
  sql_table_name: bigquery-public-data.thelook_ecommerce.products ;;

  ### DIMENSIONS ###

  dimension: id {
    primary_key: yes
    type: number
    description: "Unique ID of the product"
    sql: ${TABLE}.id ;;
  }

  dimension: category {
    description: "Product category"
    sql: TRIM(${TABLE}.category) ;;
    drill_fields: [item_name]
  }

  dimension: item_name {
    description: "Name of the product item"
    sql: TRIM(${TABLE}.name) ;;
  }

  dimension: brand {
    description: "Brand name of the product"
    sql: TRIM(${TABLE}.brand) ;;
    link: {
      label: "{{ value }} Brand Lookup Dashboard"
      url: "/dashboards/9?Brand%20Name={{ value | encode_uri }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.looker.com"
    }
    link: {
      label: "Website"
      url: "https://www.google.com/search?q={{ value | encode_uri }}+clothes&btnI"
      icon_url: "https://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
    }
    link: {
      label: "Facebook"
      url: "https://www.google.com/search?q=site:facebook.com+{{ value | encode_uri }}+clothes&btnI"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/c/c2/F_icon.svg"
    }
    drill_fields: [category, item_name]
  }

  dimension: retail_price {
    type: number
    description: "Retail price of the product"
    sql: ${TABLE}.retail_price ;;
  }

  dimension: department {
    description: "Department of the product (e.g., Men, Women)"
    sql: TRIM(${TABLE}.department) ;;
  }

  dimension: sku {
    description: "Stock Keeping Unit identifier"
    sql: ${TABLE}.sku ;;
  }

  dimension: distribution_center_id {
    type: number
    description: "ID of the distribution center stocking the product"
    sql: CAST(${TABLE}.distribution_center_id AS INT64) ;;
  }

  ## MEASURES ##

  measure: count {
    type: count
    description: "Total count of products"
    drill_fields: [detail*]
  }

  measure: brand_count {
    type: count_distinct
    description: "Count of distinct brands"
    sql: ${brand} ;;
    drill_fields: [brand, detail2*, -brand_count]
  }

  measure: category_count {
    alias: [category.count]
    type: count_distinct
    description: "Count of distinct product categories"
    sql: ${category} ;;
    drill_fields: [category, detail2*, -category_count]
  }

  measure: department_count {
    alias: [department.count]
    type: count_distinct
    description: "Count of distinct departments"
    sql: ${department} ;;
    drill_fields: [department, detail2*, -department_count]
  }

  set: detail {
    fields: [id, item_name, brand, category, department, retail_price]
  }

  set: detail2 {
    fields: [category_count, brand_count, department_count, count]
  }
}
