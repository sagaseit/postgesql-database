select 
    count(*) as Total_Amount,
    min(activity_price) as cheapest,
    max(activity_price) as most_expensive,
    round(avg(activity_price),2) as average
from activity;
