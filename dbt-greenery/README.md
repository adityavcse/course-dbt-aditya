Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices



Answers for week 1 questions:

1.
How many users do we have?

SELECT count(distinct user_id) as number_of_users from dbt_aditya.stg_users
 number_of_users 
-----------------
             130
			 


----------------------------------------------------------------

2.
On average how many orders we receive per hour


select count(*),date_trunc('hour',created_at) from dbt_aditya.stg_orders group by 2 order by 2;


with count_orders_per_hour as 
(
select count(*) as total_orders,date_trunc('hour',created_at_utc) from dbt_aditya.stg_orders group by 2 order by 2
)

select avg(total_orders) as count_orders from count_orders_per_hour

    count_orders    
--------------------
 8.1632653061224490
 
----------------------------------------------------------------
3.
on average how long does an order take from being placed to delivered

select avg((extract(epoch from (delivered_at_utc-created_at_utc)))/3600) as avg_time_to_deliver_in_hours from stg_orders

 avg_time_to_deliver_in_hours 
---------------------
   94.21958456973294
---------------------------------------------------------------------

4.
How many users made only 1 purchase/2purchase/3purchase etc

with users_order_count as
(
select user_id,count(distinct order_id) as num_orders from dbt_aditya.stg_orders group by 1 order by 2 desc
)

select 
sum (case when num_orders=1 then 1 else 0 end) as customers_with_1_order,
sum (case when num_orders=2 then 1 else 0 end) as customers_with_2_orders,
sum (case when num_orders>2 then 1 else 0 end) as customers_with_3_or_more_orders
from users_order_count
 
customers_with_1_order | customers_with_2_orders | customers_with_3_or_more_orders 
------------------------+-------------------------+---------------------------------
                     25 |                      22 |                              81
(1 row)


 

--------------------------------------------------------------------- 

5.
on avg how many unique session do we have per hour

with count_sessions_per_hour as 
(
select count(distinct session_id) as count_sessions,date_trunc('hour',created_at_utc) from dbt_aditya.stg_events group by 2 order by 2
)

select avg(count_sessions) from count_sessions_per_hour

average_sessions_per_hour
--------------------
 7.3894009216589862

