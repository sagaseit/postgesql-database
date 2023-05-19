-- smazání všech záznamů z tabulek

CREATE or replace FUNCTION clean_tables() RETURNS void AS $$
declare
  l_stmt text;
begin
  select 'truncate ' || string_agg(format('%I.%I', schemaname, tablename) , ',')
    into l_stmt
  from pg_tables
  where schemaname in ('public');

  execute l_stmt || ' cascade';
end;
$$ LANGUAGE plpgsql;
select clean_tables();

-- reset sekvenci

CREATE or replace FUNCTION restart_sequences() RETURNS void AS $$
DECLARE
i TEXT;
BEGIN
 FOR i IN (SELECT column_default FROM information_schema.columns WHERE column_default SIMILAR TO 'nextval%')
  LOOP
         EXECUTE 'ALTER SEQUENCE'||' ' || substring(substring(i from '''[a-z_]*')from '[a-z_]+') || ' '||' RESTART 1;';
  END LOOP;
END $$ LANGUAGE plpgsql;
select restart_sequences();
-- konec resetu

-- konec mazání
-- mohli bchom použít i jednotlivé příkazy truncate na každo tabulku

insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (1, 'Stanfield', 'Codrington', '2/17/1989', '3276');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (2, 'Antonio', 'Yvens', '4/22/2009', '325');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (3, 'Patti', 'Breagan', '10/26/1979', '135');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (4, 'Harriette', 'Riccioppo', '4/19/1989', '135');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (5, 'Ludovico', 'Condliffe', '6/19/1998', '974');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (6, 'Ermina', 'Cathie', '4/6/1977', '820');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (7, 'Bonnee', 'Kynd', '12/21/2009', '40');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (8, 'Camey', 'Phillipson', '7/27/1977', '773');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (9, 'Maritsa', 'Canland', '11/30/1992', '1724');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (10, 'Gilles', 'McDonogh', '1/21/1978', '33');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (11, 'Valina', 'Beazleigh', '7/11/1982', '35');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (12, 'Celene', 'Pinkard', '12/22/1989', '1985');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (13, 'Arnold', 'Crandon', '11/16/1976', '272');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (14, 'Gwenore', 'Dorrington', '11/28/1989', '1850');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (15, 'Cassandra', 'Berthomieu', '2/24/1994', '253');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (16, 'Jillana', 'O''Loughane', '1/11/1998', '10');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (17, 'Electra', 'MacArte', '2/24/1995', '808');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (18, 'Nessi', 'MacCoughan', '8/1/1985', '4670');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (19, 'Raynor', 'Seyffert', '10/9/2002', '5509');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (20, 'Adrian', 'Battson', '12/23/1984', '1334');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (21, 'Goldina', 'Brazer', '3/15/1995', '14');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (22, 'Henrik', 'Bridywater', '11/16/1994', '2278');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (23, 'Lesley', 'Romeo', '6/20/1994', '1915');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (24, 'Eolande', 'Tallowin', '8/20/1996', '4600');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (25, 'Lottie', 'Carlisle', '4/30/2010', '131');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (26, 'Cordell', 'Wherton', '12/10/1984', '444');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (27, 'Paolina', 'Behrend', '4/8/1987', '24');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (28, 'Alicea', 'Hallatt', '11/15/1995', '452');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (29, 'Bealle', 'Borrill', '3/5/1996', '26');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (30, 'Blane', 'Marousek', '5/28/1982', '754');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (31, 'Fanechka', 'Stuchbery', '10/1/2010', '1060');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (32, 'Vanya', 'Woolard', '12/30/1978', '24');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (33, 'Basile', 'Cinavas', '1/29/2006', '60');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (34, 'Tatiana', 'Lynde', '9/29/1986', '279');
insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (35, 'Reggie', 'Gott', '8/15/1991', '2625');

insert into person (person_id, person_name, person_surname, date_of_birth, passport_id) values (40, 'Alisher', 'Layik', '4/15/1998', '2325');

--USER ENTITY
insert into "user" (user_id, person_id, status, user_mail) values (401, 1, 'silver', 'dgoningb4@canalblog.com');
insert into "user" (user_id, person_id, status, user_mail) values (402, 2, 'silver', 'gheatheringtonb5@scribd.com');
insert into "user" (user_id, person_id, status, user_mail) values (403, 3, 'platinum', 'tcoklyb6@ifeng.com');
insert into "user" (user_id, person_id, status, user_mail) values (404, 4, 'platinum', 'dburchardb7@imdb.com');
insert into "user" (user_id, person_id, status, user_mail) values (405, 5, 'platinum', 'dhackeyb8@cbc.ca');
insert into "user" (user_id, person_id, status, user_mail) values (406, 6, 'platinum', 'fgirkinb9@github.com');
insert into "user" (user_id, person_id, status, user_mail) values (407, 7, 'silver', 'abrissardba@indiatimes.com');
insert into "user" (user_id, person_id, status, user_mail) values (408, 8, 'platinum', 'drochesbb@google.it');
insert into "user" (user_id, person_id, status, user_mail) values (409, 9, 'silver', 'lfaveybc@hibu.com');
insert into "user" (user_id, person_id, status, user_mail) values (410, 10, 'platinum', 'vmewburnbd@hatena.ne.jp');
insert into "user" (user_id, person_id, status, user_mail) values (411, 11, 'gold', 'ematiashvilibe@economist.com');
insert into "user" (user_id, person_id, status, user_mail) values (412, 12, 'silver', 'dgallyhaockbf@creativecommons.org');
insert into "user" (user_id, person_id, status, user_mail) values (413, 13, 'gold', 'skirleybg@furl.net');
insert into "user" (user_id, person_id, status, user_mail) values (414, 14, 'silver', 'lharlowbh@nifty.com');
insert into "user" (user_id, person_id, status, user_mail) values (415, 15, 'platinum', 'aaronovbi@lulu.com');
insert into "user" (user_id, person_id, status, user_mail) values (416, 16, 'gold', 'hfortenbj@bluehost.com');
insert into "user" (user_id, person_id, status, user_mail) values (417, 17, 'platinum', 'beasdonbk@odnoklassniki.ru');
insert into "user" (user_id, person_id, status, user_mail) values (418, 18, 'silver', 'ccarlbl@exblog.jp');
insert into "user" (user_id, person_id, status, user_mail) values (419, 19, 'platinum', 'rcroisierbm@drupal.org');
insert into "user" (user_id, person_id, status, user_mail) values (420, 20, 'silver', 'lhacklybn@opensource.org');
insert into "user" (user_id, person_id, status, user_mail) values (421, 21, 'platinum', 'nbeaneybo@elpais.com');
insert into "user" (user_id, person_id, status, user_mail) values (422, 22, 'platinum', 'vlepoidevinbp@unesco.org');
insert into "user" (user_id, person_id, status, user_mail) values (423, 23, 'platinum', 'bswainsburybq@bandcamp.com');
insert into "user" (user_id, person_id, status, user_mail) values (424, 24, 'platinum', 'egravenorbr@example.com');
insert into "user" (user_id, person_id, status, user_mail) values (425, 25, 'silver', 'dsalatinobs@google.com.au');
insert into "user" (user_id, person_id, status, user_mail) values (426, 26, 'gold', 'ldeschellebt@mashable.com');
insert into "user" (user_id, person_id, status, user_mail) values (427, 27, 'platinum', 'wmaycockbu@sfgate.com');
insert into "user" (user_id, person_id, status, user_mail) values (428, 28, 'platinum', 'eberryclothbv@creativecommons.org');
insert into "user" (user_id, person_id, status, user_mail) values (429, 29, 'gold', 'hcasonibw@toplist.cz');
insert into "user" (user_id, person_id, status, user_mail) values (430, 30, 'gold', 'chickfordbx@latimes.com');
insert into "user" (user_id, person_id, status, user_mail) values (431, 31, 'gold', 'yjacobssonby@xinhuanet.com');
insert into "user" (user_id, person_id, status, user_mail) values (432, 32, 'gold', 'vsutherbybz@example.com');
insert into "user" (user_id, person_id, status, user_mail) values (433, 33, 'gold', 'tvigursc0@amazonaws.com');
insert into "user" (user_id, person_id, status, user_mail) values (434, 34, 'platinum', 'mmccuddenc1@sfgate.com');
insert into "user" (user_id, person_id, status, user_mail) values (435, 35, 'gold', 'eluterc2@time.com');



--ADDRESS ENTITY
insert into address (address_id, city, street, postcode, building_number) values (401, 'Lyaskelya', 'Hayes', 3209, 204);
insert into address (address_id, city, street, postcode, building_number) values (402, 'Gaoping', 'Tony', 1756, 228);
insert into address (address_id, city, street, postcode, building_number) values (403, 'Citeguh', 'Reinke', 3316, 347);
insert into address (address_id, city, street, postcode, building_number) values (404, 'Campor', 'Pawling', 1541, 390);
insert into address (address_id, city, street, postcode, building_number) values (405, 'Krajan Puru', 'Summit', 1581, 182);
insert into address (address_id, city, street, postcode, building_number) values (406, 'Intibucá', 'Leroy', 2654, 484);
insert into address (address_id, city, street, postcode, building_number) values (407, 'Roma', 'Farragut', 2231, 130);
insert into address (address_id, city, street, postcode, building_number) values (408, 'Porto Velho', 'Crescent Oaks', 3474, 44);
insert into address (address_id, city, street, postcode, building_number) values (409, 'Brno', 'Vera', 2439, 257);
insert into address (address_id, city, street, postcode, building_number) values (410, 'Soledad', '2nd', 3881, 356);
insert into address (address_id, city, street, postcode, building_number) values (411, 'Shijing', 'Amoth', 2732, 496);
insert into address (address_id, city, street, postcode, building_number) values (412, 'Kovači', 'Buhler', 4038, 339);
insert into address (address_id, city, street, postcode, building_number) values (413, 'Gračec', 'Pennsylvania', 3805, 365);
insert into address (address_id, city, street, postcode, building_number) values (414, 'Coaldale', 'Old Gate', 1041, 405);
insert into address (address_id, city, street, postcode, building_number) values (415, 'Aqtobe', '13th Avenue', 1852, 252);
insert into address (address_id, city, street, postcode, building_number) values (416, 'Goiatuba', 'Logan', 2691, 46);
insert into address (address_id, city, street, postcode, building_number) values (417, 'Meicheng', 'Maryland', 3847, 199);
insert into address (address_id, city, street, postcode, building_number) values (418, 'Varnsdorf', 'Mitchell', 3543, 334);
insert into address (address_id, city, street, postcode, building_number) values (419, 'Patos Fshat', 'Northview', 1957, 331);
insert into address (address_id, city, street, postcode, building_number) values (420, 'Qinggang', 'Northfield', 3401, 87);
insert into address (address_id, city, street, postcode, building_number) values (421, 'Bagacay', 'Mayer', 3041, 242);
insert into address (address_id, city, street, postcode, building_number) values (422, 'Majia', 'Scoville', 1918, 281);
insert into address (address_id, city, street, postcode, building_number) values (423, 'Marianowo', '2nd', 3231, 163);
insert into address (address_id, city, street, postcode, building_number) values (424, 'Shuangyang', 'Sommers', 3318, 178);
insert into address (address_id, city, street, postcode, building_number) values (425, '‘Awartā', '3rd', 4122, 299);
insert into address (address_id, city, street, postcode, building_number) values (426, 'Choibalsan', 'Maryland', 4059, 459);
insert into address (address_id, city, street, postcode, building_number) values (427, 'Carazinho', 'Rusk', 1545, 386);
insert into address (address_id, city, street, postcode, building_number) values (428, 'Kamubheka', 'Columbus', 3293, 245);
insert into address (address_id, city, street, postcode, building_number) values (429, 'Nyzhnya Krynka', 'Anniversary', 4191, 109);
insert into address (address_id, city, street, postcode, building_number) values (430, 'Louriceira', 'Nelson', 2620, 161);
insert into address (address_id, city, street, postcode, building_number) values (431, 'Paris 02', 'Oriole', 2744, 484);
insert into address (address_id, city, street, postcode, building_number) values (432, 'Pakemitan', 'Gerald', 4109, 62);
insert into address (address_id, city, street, postcode, building_number) values (433, 'Kadugede', 'Coleman', 1318, 318);
insert into address (address_id, city, street, postcode, building_number) values (434, 'KIev', 'Tony', 3221, 314);
insert into address (address_id, city, street, postcode, building_number) values (435, 'Sapucaia', 'Debra', 3765, 124);


--BOOKING ENTITY
insert into hotel (hotel_id, hotel_name, rating) values (401, 'Oxygen', 1);
insert into hotel (hotel_id, hotel_name, rating) values (402, 'Lunesta', 2);
insert into hotel (hotel_id, hotel_name, rating) values (403, 'Nexa Select', 5);
insert into hotel (hotel_id, hotel_name, rating) values (404, 'Meperidine Hydrochloride', 5);
insert into hotel (hotel_id, hotel_name, rating) values (405, 'Sunbrellas Family Sunblock SPF 45', 4);
insert into hotel (hotel_id, hotel_name, rating) values (406, 'Pleo San Prot', 1);
insert into hotel (hotel_id, hotel_name, rating) values (407, 'metoprolol succinate', 1);
insert into hotel (hotel_id, hotel_name, rating) values (408, 'PhysiciansCare Antacid', 5);
insert into hotel (hotel_id, hotel_name, rating) values (409, 'Diamond', 1);
insert into hotel (hotel_id, hotel_name, rating) values (410, 'Buprenorphine Hydrochloride', 1);
insert into hotel (hotel_id, hotel_name, rating) values (411, 'Integra F', 5);
insert into hotel (hotel_id, hotel_name, rating) values (412, 'Flex24 Performance', 3);
insert into hotel (hotel_id, hotel_name, rating) values (413, 'COUGH HP', 5);
insert into hotel (hotel_id, hotel_name, rating) values (414, 'PRIME PRIMER BB', 4);
insert into hotel (hotel_id, hotel_name, rating) values (415, 'Delsym Childrens Night Time', 4);
insert into hotel (hotel_id, hotel_name, rating) values (416, 'Clorazepate dipotassium', 1);
insert into hotel (hotel_id, hotel_name, rating) values (417, 'Hydrogen Peroxide', 2);
insert into hotel (hotel_id, hotel_name, rating) values (418, 'Clonazepam', 5);
insert into hotel (hotel_id, hotel_name, rating) values (419, 'ADVATE', 2);
insert into hotel (hotel_id, hotel_name, rating) values (420, 'RENOKIN HAIR REVITALIZING', 2);
insert into hotel (hotel_id, hotel_name, rating) values (421, 'No7 Soft and Sheer Tinted Moisturiser Dark', 1);
insert into hotel (hotel_id, hotel_name, rating) values (422, 'Avant Foaming Hand Sanitizer', 1);
insert into hotel (hotel_id, hotel_name, rating) values (423, 'Hydrochlorothiazide', 3);
insert into hotel (hotel_id, hotel_name, rating) values (424, 'BP Cleanser', 5);
insert into hotel (hotel_id, hotel_name, rating) values (425, 'Xylocaine', 1);
insert into hotel (hotel_id, hotel_name, rating) values (426, 'Polymyxin B', 1);
insert into hotel (hotel_id, hotel_name, rating) values (427, 'Osteoarthritis', 4);
insert into hotel (hotel_id, hotel_name, rating) values (428, 'Sunmark Nicotine', 2);
insert into hotel (hotel_id, hotel_name, rating) values (429, 'Esterified Estrogens and Methyltestosterone', 2);
insert into hotel (hotel_id, hotel_name, rating) values (430, 'equate acetaminophen', 3);
insert into hotel (hotel_id, hotel_name, rating) values (431, 'Cepacol Sore Throat Plus Cough', 3);
insert into hotel (hotel_id, hotel_name, rating) values (432, 'Fresh Citrus', 3);
insert into hotel (hotel_id, hotel_name, rating) values (433, 'MANGO BUTTER LIPSTICK', 4);
insert into hotel (hotel_id, hotel_name, rating) values (434, 'SPF-60', 4);
insert into hotel (hotel_id, hotel_name, rating) values (435, 'Germ Safe', 4);
SELECT setval(pg_get_serial_sequence('hotel', 'hotel_id'), 435);
insert into hotel (hotel_id, hotel_name, rating) values (DEFAULT, 'Strahov blok 7', 5);
insert into hotel (hotel_id, hotel_name, rating) values (DEFAULT, 'Podoli blok D', 1);
insert into hotel (hotel_id, hotel_name, rating) values (DEFAULT, 'Masarykova Kolej', 4);



--BOOKING ENTITY
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (401, 401, 401, 401, 3, 3);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (402, 402, 402, 402, 5, 3);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (403, 403, 403, 403, 6, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (404, 404, 404, 404, 6, 3);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (405, 405, 405, 405, 5, 3);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (406, 406, 406, 406, 6, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (407, 407, 407, 407, 5, 3);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (408, 408, 408, 408, 6, 2);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (409, 409, 409, 409, 3, 3);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (410, 410, 410, 410, 2, 2);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (411, 411, 411, 411, 1, 5);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (412, 412, 412, 412, 1, 5);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (413, 413, 413, 413, 1, 3);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (414, 414, 414, 414, 2, 5);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (415, 415, 415, 415, 5, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (416, 416, 416, 416, 4, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (417, 417, 417, 417, 2, 2);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (418, 418, 418, 418, 6, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (419, 419, 419, 419, 1, 5);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (420, 420, 420, 420, 6, 5);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (421, 421, 421, 421, 2, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (422, 422, 422, 422, 1, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (423, 423, 423, 423, 3, 2);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (424, 424, 424, 424, 6, 2);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (425, 425, 425, 425, 2, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (426, 426, 426, 426, 2, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (427, 427, 427, 427, 5, 2);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (428, 428, 428, 428, 3, 2);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (429, 429, 429, 429, 3, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (430, 430, 430, 430, 4, 4);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (431, 431, 431, 431, 1, 3);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (432, 432, 432, 432, 4, 5);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (433, 433, 433, 433, 2, 5);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (434, 434, 434, 434, 5, 5);
insert into booking (booking_id, address_id, user_id, hotel_id, number_of_people, number_of_rooms) values (435, 435, 435, 435, 2, 2);


--CITY ENTITY
insert into city (city_id, city_name, city_currency, city_language) values (201, 'Bulianhe', 'Yuan Renminbi', 'West Frisian');
insert into city (city_id, city_name, city_currency, city_language) values (202, 'Tongliao', 'Yuan', 'Croatian');
insert into city (city_id, city_name, city_currency, city_language) values (203, 'Sonina', 'Zloty', 'Filipino');
insert into city (city_id, city_name, city_currency, city_language) values (204, 'Tuanchengshan', 'Yuan Renminbi', 'Armenian');
insert into city (city_id, city_name, city_currency, city_language) values (205, 'Berlin', 'Dollar', 'Danish');
insert into city (city_id, city_name, city_currency, city_language) values (206, 'Paris', 'Dinar', 'Filipino');
insert into city (city_id, city_name, city_currency, city_language) values (207, 'Radymno', 'Zloty', 'Icelandic');
insert into city (city_id, city_name, city_currency, city_language) values (208, 'Barcelona Escalante', 'Peso', 'Hungarian');
insert into city (city_id, city_name, city_currency, city_language) values (209, 'Tabor', 'Euro', 'Telugu');
insert into city (city_id, city_name, city_currency, city_language) values (210, 'Barcelona B', 'Krona', 'Lithuanian');
insert into city (city_id, city_name, city_currency, city_language) values (211, 'Verbivka', 'Hryvnia', 'Spanish');
insert into city (city_id, city_name, city_currency, city_language) values (212, 'Lyon', 'Peso', 'Malagasy');
insert into city (city_id, city_name, city_currency, city_language) values (213, 'Aktobe', 'Ruble', 'Oriya');
insert into city (city_id, city_name, city_currency, city_language) values (214, 'Kálamos', 'Euro', 'Kashmiri');
insert into city (city_id, city_name, city_currency, city_language) values (215, 'Gaoyao', 'Yuan Renminbi', 'Aymara');
insert into city (city_id, city_name, city_currency, city_language) values (216, 'Nangtang', 'Rupiah', 'Latvian');
insert into city (city_id, city_name, city_currency, city_language) values (217, 'Rabah', 'Naira', 'Hindi');
insert into city (city_id, city_name, city_currency, city_language) values (218, 'Korolev', 'Real', 'Danish');
insert into city (city_id, city_name, city_currency, city_language) values (219, 'Bashan', 'Yuan Renminbi', 'Danish');
insert into city (city_id, city_name, city_currency, city_language) values (220, 'Baras', 'Peso', 'Bislama');
insert into city (city_id, city_name, city_currency, city_language) values (221, 'Mina de São Domingos', 'Euro', 'Thai');
insert into city (city_id, city_name, city_currency, city_language) values (222, 'Rongwo', 'Yuan Renminbi', 'Lithuanian');
insert into city (city_id, city_name, city_currency, city_language) values (223, 'Prague', 'Yuan Renminbi', 'Malay');
insert into city (city_id, city_name, city_currency, city_language) values (224, 'Xunjian', 'Yuan Renminbi', 'Irish Gaelic');
insert into city (city_id, city_name, city_currency, city_language) values (225, 'Ostrava', 'Yuan Renminbi', 'Luxembourgish');
insert into city (city_id, city_name, city_currency, city_language) values (226, 'N''Djamena', 'Franc', 'Pashto');
insert into city (city_id, city_name, city_currency, city_language) values (227, 'Machang', 'Yuan Renminbi', 'Italian');
insert into city (city_id, city_name, city_currency, city_language) values (228, 'Paris Alto', 'Real', 'French');
insert into city (city_id, city_name, city_currency, city_language) values (229, 'Phoenix', 'Dollar', 'Kyrgyz');
insert into city (city_id, city_name, city_currency, city_language) values (230, 'Seremban', 'Ringgit', 'Sotho');
insert into city (city_id, city_name, city_currency, city_language) values (231, 'Dengmingsi', 'Yuan Renminbi', 'Thai');
insert into city (city_id, city_name, city_currency, city_language) values (232, 'Castrovirreyna', 'Sol', 'Montenegrin');
insert into city (city_id, city_name, city_currency, city_language) values (233, 'London', 'Yuan Renminbi', 'Ndebele');
insert into city (city_id, city_name, city_currency, city_language) values (234, 'Nakovo', 'Dinar', 'Tamil');
insert into city (city_id, city_name, city_currency, city_language) values (235, 'Saverne', 'Euro', 'Georgian');
insert into city (city_id, city_name, city_currency, city_language) values (236, 'Barcelona', 'Euro', 'Georgian');
insert into city (city_id, city_name, city_currency, city_language) values (237, 'Glasgow', 'Sterling', 'Georgian');
insert into city (city_id, city_name, city_currency, city_language) values (238, 'Almaty', 'Tenge', 'Qazaq');
--ACTIVITIES ENTITY
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (201, 201, 82, '502-237-5020', 'Sightseeing tours');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (202, 202, 92, '574-477-4060', 'Museum');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (203, 203, 74, '443-616-9394', 'Zip lining');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (204, 204, 100, '599-426-4059', 'Nightlife experiences');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (205, 205, 29, '952-984-3671', 'Bungee jumping');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (206, 206, 82, '836-504-1768', 'Art HouseF');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (207, 207, 70, '582-277-2245', 'Zip lining');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (208, 208, 83, '968-599-7717', 'Bungee jumping');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (209, 209, 62, '143-720-7468', 'Water sports');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (210, 210, 38, '457-225-6573', 'Zip lining');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (211, 211, 46, '227-488-5522', 'Theme parks');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (212, 212, 80, '739-839-5943', 'Museum');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (213, 213, 26, '399-994-2175', 'Sex shop');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (214, 214, 18, '324-248-3702', 'Wildlife safaris');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (215, 215, 63, '861-911-8142', 'Hiking and trekking');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (216, 216, 54, '481-316-4771', 'Cultural experiences');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (217, 217, 65, '463-341-7763', 'Music');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (218, 218, 45, '157-170-5631', 'Sightseeing tours');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (219, 219, 32, '205-283-8469', 'Spa and wellness treatments');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (220, 220, 94, '270-832-9870', 'Historical landmarks');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (221, 221, 52, '313-424-2938', 'Helicopter rides');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (222, 222, 25, '958-650-5649', 'Food and wine tours');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (223, 223, 44, '346-314-4780', 'Nightlife experiences');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (224, 224, 28, '647-749-0923', 'Museum');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (225, 225, 31, '244-368-7322', 'Helicopter rides');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (226, 226, 58, '214-853-9260', 'Museum');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (227, 227, 98, '517-466-3373', 'Helicopter rides');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (228, 228, 21, '863-783-0167', 'Museum');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (229, 229, 17, '246-961-5834', 'Theme parks');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (230, 230, 90, '524-575-8410', 'Museum');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (231, 231, 86, '124-620-8772', 'Historical landmarks');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (232, 232, 38, '873-137-5397', 'Museum');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (233, 233, 43, '437-130-0537', 'Snow sports');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (234, 234, 60, '892-266-9484', 'Shopping tours');
insert into activity (activity_id, city_id, activity_price, phone_number, activity_name) values (235, 235, 40, '185-582-6982', 'Hiking and trekking');


--TRIP HISTORY ENTITY
insert into trip_history (user_id, cities, favourites) values (401, 'Norfolk', 'United States');
insert into trip_history (user_id, cities, favourites) values (402, 'Coaticook', 'Canada');
insert into trip_history (user_id, cities, favourites) values (403, 'Manchester', 'United Kingdom');
insert into trip_history (user_id, cities, favourites) values (404, 'Svoboda nad Úpou', 'Czech Republic');
insert into trip_history (user_id, cities, favourites) values (405, 'Solnice', 'Czech Republic');
insert into trip_history (user_id, cities, favourites) values (406, 'Denton', 'United States');
insert into trip_history (user_id, cities, favourites) values (407, 'Brčko', 'Bosnia and Herzegovina');
insert into trip_history (user_id, cities, favourites) values (408, 'Belleville', 'Canada');
insert into trip_history (user_id, cities, favourites) values (409, 'Narutochō-mitsuishi', 'Japan');
insert into trip_history (user_id, cities, favourites) values (410, 'Minato', 'Japan');
insert into trip_history (user_id, cities, favourites) values (411, 'Srebrenik', 'Bosnia and Herzegovina');
insert into trip_history (user_id, cities, favourites) values (412, 'Hovězí', 'Czech Republic');
insert into trip_history (user_id, cities, favourites) values (413, 'Colonia Elisa', 'Argentina');
insert into trip_history (user_id, cities, favourites) values (414, 'Orlando', 'United States');
insert into trip_history (user_id, cities, favourites) values (415, 'Las Vegas', 'United States');
insert into trip_history (user_id, cities, favourites) values (416, 'Midland', 'United States');
insert into trip_history (user_id, cities, favourites) values (417, 'Studénka', 'Czech Republic');
insert into trip_history (user_id, cities, favourites) values (418, 'Bileća', 'Bosnia and Herzegovina');
insert into trip_history (user_id, cities, favourites) values (419, 'Thị Trấn Quế', 'Vietnam');
insert into trip_history (user_id, cities, favourites) values (420, 'Hradec nad Moravici', 'Czech Republic');
insert into trip_history (user_id, cities, favourites) values (421, 'Fauske', 'Norway');
insert into trip_history (user_id, cities, favourites) values (422, 'Phimai', 'Thailand');
insert into trip_history (user_id, cities, favourites) values (423, 'Bueng Samakkhi', 'Thailand');
insert into trip_history (user_id, cities, favourites) values (424, 'Ô Môn', 'Vietnam');
insert into trip_history (user_id, cities, favourites) values (425, 'Udon Thani', 'Thailand');
insert into trip_history (user_id, cities, favourites) values (426, 'Nam Đàn', 'Vietnam');
insert into trip_history (user_id, cities, favourites) values (427, 'La Viña', 'Argentina');
insert into trip_history (user_id, cities, favourites) values (428, 'Villa Nueva', 'Argentina');
insert into trip_history (user_id, cities, favourites) values (429, 'Elena', 'Argentina');
insert into trip_history (user_id, cities, favourites) values (430, 'Acton Vale', 'Canada');
insert into trip_history (user_id, cities, favourites) values (431, 'Fujishiro', 'Japan');
insert into trip_history (user_id, cities, favourites) values (432, 'Santi Suk', 'Thailand');
insert into trip_history (user_id, cities, favourites) values (433, 'Hicksville', 'United States');
insert into trip_history (user_id, cities, favourites) values (434, 'Mont-Laurier', 'Canada');
insert into trip_history (user_id, cities, favourites) values (435, 'Poříčí nad Sázavou', 'Czech Republic');


--WORKER ENTITY
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (201, 201, 'Séverine', 'St Leger', '164-839-5661', 'wstleger5k@tuttocitta.it');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (202, 202, 'Félicie', 'Lassey', '743-330-7911', 'slassey5l@umn.edu');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (203, 203, 'Céline', 'Jimenez', '407-442-7621', 'mjimenez5m@flavors.me');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (204, 204, 'Sélène', 'Shillabear', '278-753-7447', 'cshillabear5n@cbslocal.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (205, 205, 'Mårten', 'Batalle', '612-480-6990', 'gbatalle5o@chron.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (206, 206, 'Maïté', 'Reddell', '778-492-6594', 'areddell5p@blog.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (207, 207, 'Josée', 'McGauhy', '377-316-5303', 'emcgauhy5q@livejournal.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (208, 208, 'Gaétane', 'Gover', '922-213-5875', 'jgover5r@devhub.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (209, 209, 'Marie-hélène', 'Rumens', '898-737-6515', 'krumens5s@usatoday.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (210, 210, 'Danièle', 'Gutherson', '354-437-7573', 'cgutherson5t@altervista.org');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (211, 211, 'Maïly', 'Lawling', '676-737-9737', 'elawling5u@harvard.edu');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (212, 212, 'Adélaïde', 'Vautier', '998-352-1033', 'svautier5v@umn.edu');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (213, 213, 'Inès', 'Carmen', '674-786-6033', 'ccarmen5w@behance.net');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (214, 214, 'Bérénice', 'Canny', '712-171-7826', 'rcanny5x@jigsy.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (215, 215, 'Régine', 'Enstone', '678-232-2404', 'jenstone5y@edublogs.org');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (216, 216, 'Vérane', 'Rummings', '862-674-5716', 'mrummings5z@imageshack.us');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (217, 217, 'Célestine', 'Railton', '338-328-7359', 'srailton60@wunderground.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (218, 218, 'Marie-noël', 'Entissle', '303-848-4977', 'bentissle61@themeforest.net');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (219, 219, 'Maëlann', 'Peyton', '503-890-3956', 'gpeyton62@infoseek.co.jp');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (220, 220, 'Ruì', 'Wellings', '339-227-4265', 'swellings63@guardian.co.uk');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (221, 221, 'Clélia', 'Kennsley', '754-535-7187', 'gkennsley64@ihg.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (222, 222, 'Maëly', 'Conan', '135-424-9131', 'nconan65@unicef.org');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (223, 223, 'Aloïs', 'Zorzin', '769-320-8669', 'bzorzin66@clickbank.net');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (224, 224, 'Régine', 'Hulke', '165-662-0529', 'bhulke67@blog.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (225, 225, 'Stéphanie', 'Simmers', '460-553-0186', 'esimmers68@wisc.edu');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (226, 226, 'Gaïa', 'Cornfoot', '425-317-6055', 'ccornfoot69@ftc.gov');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (227, 227, 'Ruò', 'Toffel', '948-830-4329', 'ctoffel6a@about.me');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (228, 228, 'Håkan', 'Eskriett', '630-329-5902', 'neskriett6b@webs.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (229, 229, 'Clélia', 'Dumini', '626-984-3646', 'jdumini6c@psu.edu');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (230, 230, 'Marlène', 'Gerckens', '812-189-8300', 'rgerckens6d@prlog.org');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (231, 231, 'Mélodie', 'Stubbert', '633-579-6353', 'astubbert6e@wunderground.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (232, 232, 'Véronique', 'Nary', '335-569-2589', 'gnary6f@163.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (233, 233, 'Josée', 'Salmoni', '224-958-1555', 'jsalmoni6g@photobucket.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (234, 234, 'Aí', 'Wait', '337-933-8541', 'vwait6h@soundcloud.com');
insert into worker (worker_id, city_id, name, surname, phone_number, email) values (235, 235, 'Rachèle', 'Wevell', '302-240-0744', 'cwevell6i@pcworld.com');
--FOR D1


--TICKET ENTITY
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (201, 201, 1, 401, 2, '5/28/2023', '5/29/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (202, 202, 2, 402, 2, '12/26/2023', '12/27/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (203, 203, 3, 403, 5, '9/3/2023', '9/4/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (204, 204, 4, 404, 5, '7/3/2023', '7/4/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (205, 205, 5, 405, 3, '12/6/2023', '12/8/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (206, 206, 6, 406, 1, '6/30/2023', '6/30/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (207, 207, 7, 407, 4, '9/30/2023', '10/01/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (208, 208, 8, 408, 1, '12/12/2023', '12/13/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (209, 209, 9, 409, 4, '12/6/2023', '12/8/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (210, 210, 10, 410, 5, '12/8/2023', '9/12/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (211, 211, 11, 411, 4, '5/12/2023', '6/25/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (212, 212, 12, 412, 1, '11/27/2023', '8/28/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (213, 213, 13, 413, 4, '9/18/2023', '8/26/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (214, 214, 14, 414, 4, '5/19/2023', '8/11/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (215, 215, 15, 415, 5, '03/04/2023', '7/5/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (216, 216, 16, 416, 2, '8/26/2023', '7/29/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (217, 217, 17, 417, 1, '6/26/2023', '11/9/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (218, 218, 18, 418, 3, '11/26/2023', '7/10/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (219, 219, 19, 419, 4, '12/24/2023', '12/7/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (220, 220, 20, 420, 3, '11/24/2023', '10/19/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (221, 221, 21, 421, 1, '7/3/2023', '7/24/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (222, 222, 22, 422, 2, '7/24/2023', '10/31/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (223, 223, 23, 423, 4, '10/20/2023', '10/4/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (224, 224, 24, 424, 4, '8/25/2023', '7/27/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (225, 225, 25, 425, 5, '10/9/2023', '9/6/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (226, 226, 26, 426, 4, '11/8/2023', '10/19/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (227, 227, 27, 427, 4, '11/26/2023', '9/11/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (228, 228, 28, 428, 1, '6/4/2023', '7/15/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (229, 229, 29, 429, 1, '11/25/2023', '9/16/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (230, 230, 30, 430, 2, '8/9/2023', '7/8/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (231, 231, 31, 431, 5, '7/8/2023', '10/17/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (232, 232, 32, 432, 5, '11/16/2023', '10/19/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (233, 233, 33, 433, 4, '6/25/2023', '10/4/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (234, 234, 34, 434, 2, '5/8/2023', '12/12/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (235, 235, 35, 435, 3, '9/14/2023', '8/27/2023', 'Plane');


insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (237, 201, 40, 401, 2, '5/28/2023', '5/29/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (238, 202, 40, 402, 2, '12/26/2023', '12/27/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (239, 203, 40, 403, 5, '9/3/2023', '9/4/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (240, 204, 40, 404, 5, '7/3/2023', '7/4/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (241, 205, 40, 405, 3, '12/6/2023', '12/8/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (242, 206, 40, 406, 1, '6/30/2023', '6/30/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (243, 207, 40, 407, 4, '9/30/2023', '10/01/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (244, 208, 40, 408, 1, '12/12/2023', '12/13/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (245, 209, 40, 409, 4, '12/6/2023', '12/8/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (246, 210, 40, 410, 5, '12/8/2023', '9/12/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (247, 211, 40, 411, 4, '5/12/2023', '6/25/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (248, 212, 40, 412, 1, '11/27/2023', '8/28/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (249, 213, 40, 413, 4, '9/18/2023', '8/26/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (250, 214, 40, 414, 4, '5/19/2023', '8/11/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (251, 215, 40, 415, 5, '03/04/2023', '7/5/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (252, 216, 40, 416, 2, '8/26/2023', '7/29/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (253, 217, 40, 417, 1, '6/26/2023', '11/9/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (254, 218, 40, 418, 3, '11/26/2023', '7/10/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (255, 219, 40, 419, 4, '12/24/2023', '12/7/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (256, 220, 40, 420, 3, '11/24/2023', '10/19/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (257, 221, 40, 421, 1, '7/3/2023', '7/24/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (258, 222, 40, 422, 2, '7/24/2023', '10/31/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (259, 223, 40, 423, 4, '10/20/2023', '10/4/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (260, 224, 40, 424, 4, '8/25/2023', '7/27/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (261, 225, 40, 425, 5, '10/9/2023', '9/6/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (262, 226, 40, 426, 4, '11/8/2023', '10/19/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (263, 227, 40, 427, 4, '11/26/2023', '9/11/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (264, 228, 40, 428, 1, '6/4/2023', '7/15/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (265, 229, 40, 429, 1, '11/25/2023', '9/16/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (266, 230, 40, 430, 2, '8/9/2023', '7/8/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (267, 231, 40, 431, 5, '7/8/2023', '10/17/2023', 'Bus');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (268, 232, 40, 432, 5, '11/16/2023', '10/19/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (269, 233, 40, 433, 4, '6/25/2023', '10/4/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (270, 234, 40, 434, 2, '5/8/2023', '12/12/2023', 'Train');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (271, 235, 40, 435, 3, '9/14/2023', '8/27/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (272, 236, 40, 430, 3, '9/14/2023', '8/27/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (273, 237, 40, 432, 3, '9/14/2023', '8/27/2023', 'Plane');
insert into ticket (ticket_id, city_id, person_id, user_id, number_of_people, departure_time, arrival_time, transport_type) values (274, 238, 40, 430, 3, '9/14/2023', '8/27/2023', 'Plane');




--ACTIVITY ADDRESS
insert into activity_address (activity_id, address_id) values (201, 401);
insert into activity_address (activity_id, address_id) values (202, 402);
insert into activity_address (activity_id, address_id) values (203, 403);
insert into activity_address (activity_id, address_id) values (204, 404);
insert into activity_address (activity_id, address_id) values (205, 405);
insert into activity_address (activity_id, address_id) values (206, 406);
insert into activity_address (activity_id, address_id) values (207, 407);
insert into activity_address (activity_id, address_id) values (208, 408);
insert into activity_address (activity_id, address_id) values (209, 409);
insert into activity_address (activity_id, address_id) values (210, 410);
insert into activity_address (activity_id, address_id) values (211, 411);
insert into activity_address (activity_id, address_id) values (212, 412);
insert into activity_address (activity_id, address_id) values (213, 413);
insert into activity_address (activity_id, address_id) values (214, 414);
insert into activity_address (activity_id, address_id) values (215, 415);
insert into activity_address (activity_id, address_id) values (216, 416);
insert into activity_address (activity_id, address_id) values (217, 417);
insert into activity_address (activity_id, address_id) values (218, 418);
insert into activity_address (activity_id, address_id) values (219, 419);
insert into activity_address (activity_id, address_id) values (220, 420);
insert into activity_address (activity_id, address_id) values (221, 421);
insert into activity_address (activity_id, address_id) values (222, 422);
insert into activity_address (activity_id, address_id) values (223, 423);
insert into activity_address (activity_id, address_id) values (224, 424);
insert into activity_address (activity_id, address_id) values (225, 425);
insert into activity_address (activity_id, address_id) values (226, 426);
insert into activity_address (activity_id, address_id) values (227, 427);
insert into activity_address (activity_id, address_id) values (228, 428);
insert into activity_address (activity_id, address_id) values (229, 429);
insert into activity_address (activity_id, address_id) values (230, 430);
insert into activity_address (activity_id, address_id) values (231, 431);
insert into activity_address (activity_id, address_id) values (232, 432);
insert into activity_address (activity_id, address_id) values (233, 433);
insert into activity_address (activity_id, address_id) values (234, 434);
insert into activity_address (activity_id, address_id) values (235, 435);

--GUIDE ENTITY
insert into guide (worker_id) values (201);
insert into guide (worker_id) values (202);
insert into guide (worker_id) values (203);
insert into guide (worker_id) values (204);
insert into guide (worker_id) values (205);
insert into guide (worker_id) values (206);
insert into guide (worker_id) values (207);
insert into guide (worker_id) values (208);
insert into guide (worker_id) values (209);
insert into guide (worker_id) values (210);
insert into guide (worker_id) values (211);
insert into guide (worker_id) values (212);
insert into guide (worker_id) values (213);
insert into guide (worker_id) values (214);
insert into guide (worker_id) values (215);
insert into guide (worker_id) values (216);
insert into guide (worker_id) values (217);
insert into guide (worker_id) values (218);
insert into guide (worker_id) values (219);
insert into guide (worker_id) values (220);
insert into guide (worker_id) values (221);
insert into guide (worker_id) values (222);
insert into guide (worker_id) values (223);
insert into guide (worker_id) values (224);
insert into guide (worker_id) values (225);
insert into guide (worker_id) values (226);
insert into guide (worker_id) values (227);
insert into guide (worker_id) values (228);
insert into guide (worker_id) values (229);
insert into guide (worker_id) values (230);
insert into guide (worker_id) values (231);
insert into guide (worker_id) values (232);
insert into guide (worker_id) values (233);
insert into guide (worker_id) values (234);
insert into guide (worker_id) values (235);

--QUESTION ANSWER ENTITY
insert into question_answer	 (worker_id) values (201);
insert into question_answer	 (worker_id) values (202);
insert into question_answer	 (worker_id) values (203);
insert into question_answer	 (worker_id) values (204);
insert into question_answer	 (worker_id) values (205);
insert into question_answer	 (worker_id) values (206);
insert into question_answer	 (worker_id) values (207);
insert into question_answer	 (worker_id) values (208);
insert into question_answer	 (worker_id) values (209);
insert into question_answer	 (worker_id) values (210);
insert into question_answer	 (worker_id) values (211);
insert into question_answer	 (worker_id) values (212);
insert into question_answer	 (worker_id) values (213);
insert into question_answer	 (worker_id) values (214);
insert into question_answer	 (worker_id) values (215);
insert into question_answer	 (worker_id) values (216);
insert into question_answer	 (worker_id) values (217);
insert into question_answer	 (worker_id) values (218);
insert into question_answer	 (worker_id) values (219);
insert into question_answer	 (worker_id) values (220);
insert into question_answer	 (worker_id) values (221);
insert into question_answer	 (worker_id) values (222);
insert into question_answer	 (worker_id) values (223);
insert into question_answer	 (worker_id) values (224);
insert into question_answer	 (worker_id) values (225);
insert into question_answer	 (worker_id) values (226);
insert into question_answer	 (worker_id) values (227);
insert into question_answer	 (worker_id) values (228);
insert into question_answer	 (worker_id) values (229);
insert into question_answer	 (worker_id) values (230);
insert into question_answer	 (worker_id) values (231);
insert into question_answer	 (worker_id) values (232);
insert into question_answer	 (worker_id) values (233);
insert into question_answer	 (worker_id) values (234);
insert into question_answer	 (worker_id) values (235);
