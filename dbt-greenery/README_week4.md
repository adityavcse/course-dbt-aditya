Product funnel

select count(*) as distinct_session,
sum(num_events_in_session) as total,
sum(page_views) as page_views,
sum(add_to_carts) as add_to_carts,
sum(checkouts) as checkouts,
sum(packages_shipped) as packages_shipped,
sum(account_created) as account_created,
sum(deletes_from_cart) as deletes_from_cart
 from fact_product_funnel



![image](https://user-images.githubusercontent.com/2854207/145714078-07072145-730b-468c-855f-378cd787553e.png)
