view: ads_general {
  derived_table: {
    sql: SELECT 'Google' Canal
       ,DESARROLLO
       ,CAMPANIA
       ,IMPR as IMPRESIONES
       ,CLICS
       ,CTR
       ,PROM_CPC AS CPC
       ,COSTO AS IMPORTE_GASTADO
       ,FECHA
 FROM `eon-internal-bigquery.Social_Media_Ads.Google`
union all
SELECT 'Facebook' Canal
       ,DESARROLLO
       ,CAMPANIA
       ,IMPRESIONES
       ,CLICS
       ,CTR
       ,CPC
       ,IMPORTE_GASTADO
       ,FECHA FROM `eon-internal-bigquery.Social_Media_Ads.Facebook`
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: canal {
    type: string
    sql: ${TABLE}.Canal ;;
  }

  dimension: desarrollo {
    type: string
    sql: ${TABLE}.DESARROLLO ;;
  }

  dimension: campania {
    type: string
    sql: ${TABLE}.CAMPANIA ;;
  }

  dimension: impresiones {
    type: number
    sql: ${TABLE}.IMPRESIONES ;;
  }

  dimension: clics {
    type: number
    sql: ${TABLE}.CLICS ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.CTR ;;
  }

  dimension: cpc {
    type: number
    sql: ${TABLE}.CPC ;;
  }

  dimension: importe_gastado {
    type: number
    sql: ${TABLE}.IMPORTE_GASTADO ;;
  }

  measure: sum_importe_gastado {
   label: "importe_gastado"
    type: sum
    sql: ${importe_gastado};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA ;;
  }

  set: detail {
    fields: [
      canal,
      desarrollo,
      campania,
      impresiones,
      clics,
      ctr,
      cpc,
      importe_gastado,
      fecha
    ]
  }
}
