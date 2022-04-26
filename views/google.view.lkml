# The name of this view in Looker is "Google"
view: google {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Social_Media_Ads.Google`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Campania" in Explore.

  dimension: campania {
    type: string
    sql: ${TABLE}.CAMPANIA ;;
  }

  dimension: clics {
    type: number
    sql: ${TABLE}.CLICS ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_clics {
    type: sum
    sql: ${clics} ;;
  }

  measure: average_clics {
    type: average
    sql: ${clics} ;;
  }

  dimension: conversiones {
    type: number
    sql: ${TABLE}.CONVERSIONES ;;
  }

  dimension: costo {
    type: number
    sql: ${TABLE}.COSTO ;;
  }

  dimension: costo_conv {
    type: number
    sql: ${TABLE}.COSTO_CONV ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.CTR ;;
  }

  dimension: desarrollo {
    type: string
    sql: ${TABLE}.DESARROLLO ;;
  }

  dimension: estado_campania {
    type: string
    sql: ${TABLE}.ESTADO_CAMPANIA ;;
  }

  dimension: estatus {
    type: string
    sql: ${TABLE}.ESTATUS ;;
  }

  dimension: estrategia_oferta {
    type: string
    sql: ${TABLE}.ESTRATEGIA_OFERTA ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA ;;
  }

  dimension: grupo_anuncios {
    type: string
    sql: ${TABLE}.GRUPO_ANUNCIOS ;;
  }

  dimension: impr {
    type: number
    sql: ${TABLE}.IMPR ;;
  }

  dimension: moneda {
    type: string
    sql: ${TABLE}.MONEDA ;;
  }

  dimension: presupuesto {
    type: number
    sql: ${TABLE}.PRESUPUESTO ;;
  }

  dimension: prom_cpc {
    type: number
    sql: ${TABLE}.PROM_CPC ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
