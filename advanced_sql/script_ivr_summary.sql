SELECT 
    DISTINCT a.calls_ivr_id AS ivr_id,
    a.calls_phone_number AS phone_number,
    a.calls_ivr_result AS ivr_result, 
    CASE 
        WHEN a.calls_vdn_label LIKE 'ATC%' THEN 'FRONT' 
        WHEN a.calls_vdn_label LIKE 'TECH%' THEN 'TECH' 
        WHEN a.calls_vdn_label = 'ABSORTION' THEN 'ABSORTION' 
        ELSE 'RESTO' 
    END AS vdn_aggregation,
    a.calls_start_date AS start_date, 
    a.calls_end_date AS end_date, 
    a.calls_total_duration AS total_duration, 
    a.calls_customer_segment AS customer_segment, 
    a.calls_ivr_language AS ivr_language, 
    a.calls_steps_module AS steps_module, 
    a.calls_module_aggregation AS module_aggregation,
    MAX(IFNULL(a.document_type, 'NULL')) document_type,
    MAX(IFNULL(a.document_identification, 'NULL')) document_identifaction,
    MAX(IFNULL(a.customer_phone, 'NULL')) customer_phone,
    MAX(IFNULL(a.billing_account_id, 'NULL')) billing_account_id,
    IF(a.calls_module_aggregation = 'AVERIA_MASIVA',1,0) AS masiva_lg,
    IF(a.step_name = 'CUTOMERINFOBYPHONE.TX' AND a.step_description_error = 'NULL',1,0) AS info_by_phone_lg,
    MAX(IF (DATETIME_DIFF(a.calls_start_date, b.calls_start_date, MINUTE) < 1440, 1, 0)) AS repeated_phone_24H, 
    MAX(IF (DATETIME_DIFF(a.calls_start_date, b.calls_start_date, MINUTE) > -1440, 1, 0)) AS cause_recall_phone_24H
    FROM keepcoding.ivr_detail a
    LEFT 
    JOIN keepcoding.ivr_detail b 
    ON a.calls_phone_number = b.calls_phone_number 
    AND a.calls_ivr_id <> b.calls_ivr_id 
    GROUP BY 
          ivr_id,
          phone_number,
          vdn_aggregation,
          ivr_result,
          start_date, 
          end_date, 
          total_duration, 
          customer_segment, 
          ivr_language, 
          steps_module, 
          module_aggregation,
          info_by_phone_lg
          
