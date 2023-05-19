/* Select hotels with rating 1 and booking with number of people is 2 */

select distinct hotel_name as name, rating as ranking, number_of_people as bookedfor
from (
    select distinct *
    from hotel
    natural join booking
    where rating = 1
) FindTotal
where number_of_people = 2;
