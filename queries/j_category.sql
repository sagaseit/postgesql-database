/* Retrieve all the workers who have been assigned to at least one city, along with their details, and order them by their worker ID in ascending order. */

select *
from booking
where exists(
select 1 from "user" where user_id=booking_id)
order by user_id asc;

select *
from booking
where booking_id in(
    select user_id from "user" where user_id is not null
)
order by user_id asc;

select * from(
    select *
    from booking
) vysledek
order by user_id asc;
