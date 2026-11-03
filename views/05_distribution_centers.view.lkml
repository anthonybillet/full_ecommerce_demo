view: distribution_centers {
  sql_table_name: bigquery-public-data.thelook_ecommerce.distribution_centers ;;

  dimension: id {
    type: number
    primary_key: yes
    description: "Unique ID of the distribution center"
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    description: "Name of the distribution center"
    sql: ${TABLE}.name ;;
  }

  dimension: location {
    type: location
    description: "Geographical coordinates of the distribution center"
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  dimension: latitude {
    description: "Latitude of the distribution center"
    sql: ${TABLE}.latitude ;;
    hidden: yes
  }

  dimension: longitude {
    description: "Longitude of the distribution center"
    sql: ${TABLE}.longitude ;;
    hidden: yes
  }
}
