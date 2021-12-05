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






Conversion rate by product:


with product_conversion_metric as (
select product_id,
count(distinct session_id) as num_visits ,
count(distinct order_id) as num_orders
from stg_events 
INNER JOIN stg_order_items b using(product_id)
group by 1
)

![image](https://user-images.githubusercontent.com/2854207/144750131-f9dc874f-1d6c-4d43-9bd2-8b90135890e9.png)



DAG
---

![image](https://user-images.githubusercontent.com/2854207/144750483-8c5c1dde-260d-46da-8bd9-03a65ac5ffaf.png)

select product_id, num_orders*100.0/num_visits as product_conversion from product_conversion_metric
order by 2 desc 


