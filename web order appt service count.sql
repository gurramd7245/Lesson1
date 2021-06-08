select count(distinct a11.fct_web_order_analysis_identifier)  Web_Order_Count_CP
	from	dwh.fct_web_order_analysis_detail_core	a11
	join dwh.fct_web_order_analysis_core	a17		                    on 	(a11.fct_web_order_analysis_identifier = a17.fct_web_order_analysis_identifier 
                                                                  and a11.fitment_legacy_identifier = a17.fitment_legacy_identifier)
	join	dwh.lkp_web_channel	a16  		                              on 	a11.web_channel_lookup_identifier = a16.web_channel_lookup_identifier
	join	dwh.dim_date_prior_period_dynamic_transformation	a15		  on 	(a11.web_order_date_dimension_identifier = a15.date_dimension_identifier)
	join	dwh.dim_store_active	a12		                              on 	a11.store_dimension_durable_key = a12.store_dimension_durable_key
  join	dwh.lkp_region	a13		                                    on 	a12.region_lookup_identifier = a13.region_lookup_identifier
  join	dwh.lkp_business_unit	a14		                              on 	a12.business_unit_lookup_identifier = a14.business_unit_lookup_identifier
where 1=1
--and a15.date_dimension_identifier between '20210101' and '20210105' --33191
and a15.date_dimension_identifier between '20200103' and '20200107'  --23921
and a15.chosen_period in ('Current Period')
and  a13.region_code not in ('') 
and a14.business_unit_type_code in ('0005', '0006', '0008', '1', '2', '5', 'DTC', 'DTD')
and a17.appointment_indicator in ('Y')
and a16.web_channel_code in ('WEB_APPT_SRV', 'WEB_APPT_CON_SRV');

select count(distinct a11.fct_web_order_analysis_identifier)  Web_Order_Count_CP
	from	dwh.fct_web_order_analysis_detail_core	a11
	join	dwh.dim_date_prior_period_dynamic_transformation	a15		  on 	(a11.web_order_date_dimension_identifier = a15.date_dimension_identifier)
	join	dwh.dim_store_active	a12		                              on 	a11.store_dimension_durable_key = a12.store_dimension_durable_key
  join	dwh.lkp_region	a13		                                    on 	a12.region_lookup_identifier = a13.region_lookup_identifier
  join	dwh.lkp_business_unit	a14		                              on 	a12.business_unit_lookup_identifier = a14.business_unit_lookup_identifier
where a15.date_dimension_identifier between '20210101' and '20210105' 
and  a13.region_code not in ('') 
and a14.business_unit_type_code in ('0005', '0006', '0008', '1', '2', '5', 'DTC', 'DTD') ;



