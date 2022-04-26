# The name of this view in Looker is "Facebook"
view: facebook {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Social_Media_Ads.Facebook`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Alcance" in Explore.

  dimension: alcance {
    hidden: yes
    type: number
    sql: ${TABLE}.ALCANCE ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_alcance {
    type: sum
    sql: ${alcance} ;;
  }

  measure: average_alcance {
    type: average
    sql: ${alcance} ;;
  }

  dimension: campania {
    type: string
    sql: ${TABLE}.CAMPANIA ;;
  }

  measure: count_campania {
    type: count_distinct
    sql: ${campania} ;;
  }



  dimension: clics {
    hidden: yes
    type: number
    sql: ${TABLE}.CLICS ;;
  }

  measure: total_clics {
    type: sum
    sql: ${clics} ;;
  }

  dimension: costo_por_resultado {
    hidden: yes
    type: number
    sql: ${TABLE}.COSTO_POR_RESULTADO ;;
  }

  measure: total_costo_por_resultado {
    type: sum
    sql: ${costo_por_resultado} ;;
  }

  dimension: cpc {
    hidden: yes
    type: number
    sql: ${TABLE}.CPC ;;
  }

  measure: total_cpc {
    type: sum
    sql: ${cpc} ;;
  }


  dimension: ctr {
    hidden: yes
    type: number
    sql: ${TABLE}.CTR ;;
  }

  measure: total_ctr {
    type: sum
    sql: ${ctr} ;;
  }

  dimension: desarrollo {
    type: string
    sql: ${TABLE}.DESARROLLO ;;
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

  dimension_group: fin_informe {
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
    sql: ${TABLE}.FIN_INFORME ;;
  }

  dimension: importe_gastado {
    hidden: yes
    type: number
    sql: ${TABLE}.IMPORTE_GASTADO ;;
  }

  measure: total_importe_gastado {
    type: sum
    sql: ${importe_gastado} ;;
  }

  dimension: impresiones {
    hidden: yes
    type: number
    sql: ${TABLE}.IMPRESIONES ;;
  }

  measure: total_impresiones {
    type: sum
    sql: ${impresiones} ;;
  }

  dimension_group: inicio_informe {
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
    sql: ${TABLE}.INICIO_INFORME ;;
  }

  dimension: nombre_conjunto_anuncios {
    type: string
    sql: ${TABLE}.NOMBRE_CONJUNTO_ANUNCIOS ;;
  }

  dimension: resultados {
    hidden: yes
    type: number
    sql: ${TABLE}.RESULTADOS ;;
  }

  measure: total_resultados {
    type: sum
    sql: ${resultados} ;;
  }

  dimension: tipo_resultado {
    type: string
    sql: ${TABLE}.TIPO_RESULTADO ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
