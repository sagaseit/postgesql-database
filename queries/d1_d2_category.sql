/* Show person's id person that visited every city */

--D1
SELECT DISTINCT person_id
FROM (
    SELECT DISTINCT person_id,
                    city_id
    FROM TICKET
    NATURAL JOIN PERSON
) R1
EXCEPT
SELECT DISTINCT person_id
FROM (
    SELECT DISTINCT *
    FROM (
        SELECT DISTINCT person_id
        FROM (
            SELECT DISTINCT person_id,
                            city_id
            FROM TICKET
            NATURAL JOIN PERSON
        ) R1
    ) R2
    CROSS JOIN (
        SELECT DISTINCT city_id
        FROM CITY
    ) R3
    EXCEPT
    SELECT DISTINCT person_id,
                    city_id
    FROM TICKET
    NATURAL JOIN PERSON
) R4;

-- D2
select distinct person_id
from person where person_id in (
    select person_id 
    from ticket t where person_id in(
        select person_id from(
            select * from person p where
            (select count(distinct city_id) from ticket t where t.person_id=p.person_id)
            =
            (select count(city_id) from city)
        )bla
    )
);


