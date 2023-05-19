create or replace view RichUser as
select *
from person p
where person_id is NULL and (select count(*) from ticket t where p.person_id=t.ticket_id)>1
with check option;

select person.*
from person;
