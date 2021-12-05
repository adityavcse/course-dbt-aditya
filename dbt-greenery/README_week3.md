Conversion rate:

Query
-----
with product_conversion as 
(
SELECT 
sum(case when event_type='checkout' then 1 else 0 end) as number_of_orders,
count(distinct session_id) as number_of_sessions

 FROM "stg_events" )

select number_of_orders,number_of_sessions,number_of_orders*100.0/number_of_sessions from product_conversion

Result
![image](https://user-images.githubusercontent.com/2854207/144750069-5e3126bd-da73-4245-8652-405585cc62c0.png)

