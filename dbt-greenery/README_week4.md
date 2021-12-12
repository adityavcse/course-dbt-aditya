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




Questions that can  be answered with the product funnel:

1. Add to cart rate
2. checkout rate
3. percent of packages shipped over the number of checkouts
4. delete from cart rate over add to carts


sample query for one of the metrics:
----------------------------
select 
sum(add_to_carts) *100.0/count(*) as add_to_cart_percent,
sum(checkouts)*100.0/count(*) as checkout_percent,
sum(packages_shipped)*100.0/count(*) as shipped_percent
 from fact_product_funnel
 
 ![image](https://user-images.githubusercontent.com/2854207/145714199-335ae312-fbc9-4176-8fcb-b4d2f4b2ce81.png)





