/* Choose worker's name and surname that works in London and nowhere else */

select worker.name, worker.surname
from worker join city on worker_id=city.city_id

except 

select worker.name, worker.surname
from worker join city on worker_id=city.city_id
where city_name!='London'
;
