/* Situation in the world is affecting to tourism. Prices are increasing dramatically, we need to update the prices for our activities :( */

select a.activity_name, a.activity_price as price_before_inflation FROM activity a
order by a.activity_price desc;
update activity
set activity_price = activity_price * 1.5
where city_id in (
    select city_id
    from activity
);

select a.activity_name, a.activity_price as price_after_inflation from activity a
order by a.activity_price desc;
