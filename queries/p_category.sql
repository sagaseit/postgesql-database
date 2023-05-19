/* Select 3 hotels with worst ratings and delete them. Our company provides only best hotels for our clients :) */

delete from hotel
where hotel_id in(
select hotel_id
from hotel
order by rating asc
limit 3
);

