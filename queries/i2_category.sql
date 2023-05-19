select transport_type, round(avg(number_of_people),2) average
from ticket
group by transport_type
