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
       ,CONVERSIONES
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
       ,FECHA
       ,0 CONVERSIONES FROM `eon-internal-bigquery.Social_Media_Ads.Facebook`
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: canal {
    label: "Platoforma"
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

  measure: count_campania {
    label: "Total Campañas"
    type: count_distinct
    sql: ${campania};;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  dimension: impresiones {
    type: number
    sql: ${TABLE}.IMPRESIONES ;;
  }

  measure: sum_impresiones {
    label: "Total_impresiones"
    type: sum
    sql: ${impresiones};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }




  dimension: clics {
    type: number
    sql: ${TABLE}.CLICS ;;
  }

  measure: sum_clics {
    label: "Total_clics"
    type: sum
    sql: ${clics};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.CTR ;;
  }

  measure: sum_ctr {
    label: "Total ctr"
    type: sum
    sql: ${ctr};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  dimension: cpc {
    type: number
    sql: ${TABLE}.CPC ;;
  }

  measure: sum_cpc {
    label: "Total cpc"
    type: sum
    sql: ${cpc};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  dimension: conversiones {
    type: number
    sql: ${TABLE}.CONVERSIONES ;;
  }

  measure: sum_conversiones {
    label: "Total Conversiones"
    type: sum
    sql: ${conversiones};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  dimension: importe_gastado {
    type: number
    sql: ${TABLE}.IMPORTE_GASTADO ;;
  }

  measure: sum_importe_gastado {
   label: "Total Costos"
    type: sum
    sql: ${importe_gastado};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  dimension: campaign_image {
    type: string
    label: "imagen"
    sql: case when ${canal}="Google" then "https://img2.freepng.es/20190417/yxg/kisspng-google-ads-pay-per-click-online-advertising-integrations-data-world-5cb7ccc3ae2a54.8588411615555493797134.jpg"
             when ${canal}="Facebook" then "https://cdn.worldvectorlogo.com/logos/facebook-ads.svg"
                else "0" end ;;
     html: <img src="{{value}}"width="50px" height="50px" /> ;;
  }


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

    ]
  }
}
