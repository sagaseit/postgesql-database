select activity_name, sum(activity_price) as totalprice
from activity
where activity_price > 25
group by activity_name
having sum(activity_price) > 100
order by activity_name asc;
