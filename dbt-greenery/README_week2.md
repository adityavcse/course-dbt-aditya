Heres the answers for week 2. 

Were you able to answer the data question asked i.e. What is our user repeat rate? 
80%

Were you able to create a marts folder for the three business lines? 
Yes

Were you able to create at least 1 intermediate model and 1 dimension/fact model within each marts model? 
Yes

Were you able to apply dbt tests to your week 1 or week 2 models? 
Yes. Added tests for unique/not_null/accepted_values/relationship test and positive_values. 
However I did not create any new macros

What was most challenging/surprising in completing this week’s project?
Arriving at the final set of facts and dimensions and what table to use as intermediate was a challenge
Eg. address can be part of user dimension. But the user can order for his own address/ or a different address . so keeping address at the shipment level also makes sense

Is there anywhere you are still stuck or confused? Or Is there a particular part of the project where you want focused feedback from your reviewers?
1. All the models created in 1 single schema but a better practice is to have tables created in individual schemas(marketing/product) according to the functional group. I was able to check the working of it by explicitly mentioning in the model but not able to control this from the db_project.yml file. Any sample yml files would be helpful for me to understand where I went wrong

2. The way the intermediate tables and the final fact and dimension tables are modelled. What improvements can be done
3. Any specific and obvious test case that is required and its missed


What are you most proud of about your project?
Able to complete the project on time and have the models organized in specific folders.
Also with the fact_user_order , I am able to answer lot of questions like how many orders were delivered early/ late/ on time. when the user created his account vs when the first purchase was made. 


The model/ the final tables etc  can be improved through further iterations.
