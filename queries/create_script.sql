DROP FUNCTION IF EXISTS remove_all();

CREATE or replace FUNCTION remove_all() RETURNS void AS $$
DECLARE
    rec RECORD;
    cmd text;
BEGIN
    cmd := '';

    FOR rec IN SELECT
            'DROP SEQUENCE ' || quote_ident(n.nspname) || '.'
                || quote_ident(c.relname) || ' CASCADE;' AS name
        FROM
            pg_catalog.pg_class AS c
        LEFT JOIN
            pg_catalog.pg_namespace AS n
        ON
            n.oid = c.relnamespace
        WHERE
            relkind = 'S' AND
            n.nspname NOT IN ('pg_catalog', 'pg_toast') AND
            pg_catalog.pg_table_is_visible(c.oid)
    LOOP
        cmd := cmd || rec.name;
    END LOOP;

    FOR rec IN SELECT
            'DROP TABLE ' || quote_ident(n.nspname) || '.'
                || quote_ident(c.relname) || ' CASCADE;' AS name
        FROM
            pg_catalog.pg_class AS c
        LEFT JOIN
            pg_catalog.pg_namespace AS n
        ON
            n.oid = c.relnamespace WHERE relkind = 'r' AND
            n.nspname NOT IN ('pg_catalog', 'pg_toast') AND
            pg_catalog.pg_table_is_visible(c.oid)
    LOOP
        cmd := cmd || rec.name;
    END LOOP;

    EXECUTE cmd;
    RETURN;
END;
$$ LANGUAGE plpgsql;
select remove_all();

CREATE TABLE activity (
    activity_id SERIAL,
    city_id INTEGER NOT NULL,
    activity_name VARCHAR(256) NOT NULL,
    phone_number VARCHAR(256) NOT NULL,
    activity_price INTEGER NOT NULL
);
ALTER TABLE activity ADD CONSTRAINT pk_activity PRIMARY KEY (activity_id);

CREATE TABLE address (
    address_id SERIAL,
    city VARCHAR(256) NOT NULL,
    street VARCHAR(256) NOT NULL,
    postcode INTEGER NOT NULL,
    building_number INTEGER NOT NULL
);
ALTER TABLE address ADD CONSTRAINT pk_address PRIMARY KEY (address_id);
ALTER TABLE address ADD CONSTRAINT uc_address_city UNIQUE (city);

CREATE TABLE booking (
    booking_id SERIAL,
    address_id INTEGER NOT NULL,
    hotel_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    number_of_people INTEGER NOT NULL,
    number_of_rooms INTEGER NOT NULL
);
ALTER TABLE booking ADD CONSTRAINT pk_booking PRIMARY KEY (booking_id);

CREATE TABLE city (
    city_id SERIAL,
    city_name VARCHAR(256) NOT NULL,
    city_currency VARCHAR(256),
    city_language VARCHAR(256)
);
ALTER TABLE city ADD CONSTRAINT pk_city PRIMARY KEY (city_id);
ALTER TABLE city ADD CONSTRAINT uc_city_city_name UNIQUE (city_name);

CREATE TABLE guide (
    worker_id INTEGER NOT NULL
);
ALTER TABLE guide ADD CONSTRAINT pk_guide PRIMARY KEY (worker_id);

CREATE TABLE hotel (
    hotel_id SERIAL,
    hotel_name VARCHAR(256) NOT NULL,
    rating INTEGER NOT NULL
);
ALTER TABLE hotel ADD CONSTRAINT pk_hotel PRIMARY KEY (hotel_id);

CREATE TABLE person (
    person_id SERIAL,
    person_name VARCHAR(256) NOT NULL,
    person_surname VARCHAR(256) NOT NULL,
    date_of_birth DATE NOT NULL,
    passport_id INTEGER NOT NULL
);
ALTER TABLE person ADD CONSTRAINT pk_person PRIMARY KEY (person_id);

CREATE TABLE question_answer (
    worker_id INTEGER NOT NULL
);
ALTER TABLE question_answer ADD CONSTRAINT pk_question_answer PRIMARY KEY (worker_id);

CREATE TABLE ticket (
    ticket_id SERIAL,
    city_id INTEGER NOT NULL,
    person_id INTEGER,
    user_id INTEGER NOT NULL,
    number_of_people INTEGER NOT NULL,
    departure_time DATE NOT NULL,
    arrival_time DATE NOT NULL,
    transport_type VARCHAR(256) NOT NULL
);
ALTER TABLE ticket ADD CONSTRAINT pk_ticket PRIMARY KEY (ticket_id);

CREATE TABLE trip_history (
    user_id INTEGER NOT NULL,
    cities VARCHAR(256) NOT NULL,
    favourites VARCHAR(256) NOT NULL
);
ALTER TABLE trip_history ADD CONSTRAINT pk_trip_history PRIMARY KEY (user_id);

CREATE TABLE "user" (
    user_id SERIAL,
    person_id INTEGER NOT NULL,
    status VARCHAR(256),
    user_mail VARCHAR(256) NOT NULL
);
ALTER TABLE "user" ADD CONSTRAINT pk_user PRIMARY KEY (user_id);

CREATE TABLE worker (
    worker_id SERIAL,
    city_id INTEGER NOT NULL,
    name VARCHAR(256) NOT NULL,
    surname VARCHAR(256) NOT NULL,
    phone_number VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL
);
ALTER TABLE worker ADD CONSTRAINT pk_worker PRIMARY KEY (worker_id);

CREATE TABLE activity_address (
    address_id INTEGER NOT NULL,
    activity_id INTEGER NOT NULL
);
ALTER TABLE activity_address ADD CONSTRAINT pk_address_activity PRIMARY KEY (address_id, activity_id);

ALTER TABLE activity ADD CONSTRAINT fk_activity_city FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE CASCADE;

ALTER TABLE booking ADD CONSTRAINT fk_booking_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE CASCADE;
ALTER TABLE booking ADD CONSTRAINT fk_booking_hotel FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id) ON DELETE CASCADE;
ALTER TABLE booking ADD CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES "user" (user_id) ON DELETE CASCADE;

ALTER TABLE guide ADD CONSTRAINT fk_guide_worker FOREIGN KEY (worker_id) REFERENCES worker (worker_id) ON DELETE CASCADE;

ALTER TABLE question_answer ADD CONSTRAINT fk_question_answer_worker FOREIGN KEY (worker_id) REFERENCES worker (worker_id) ON DELETE CASCADE;

ALTER TABLE ticket ADD CONSTRAINT fk_ticket_city FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE CASCADE;
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_person FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_user FOREIGN KEY (user_id) REFERENCES "user" (user_id) ON DELETE CASCADE;

ALTER TABLE trip_history ADD CONSTRAINT fk_trip_history_user FOREIGN KEY (user_id) REFERENCES "user" (user_id) ON DELETE CASCADE;

ALTER TABLE "user" ADD CONSTRAINT fk_user_person FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;

ALTER TABLE worker ADD CONSTRAINT fk_worker_city FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE CASCADE;

ALTER TABLE activity_address ADD CONSTRAINT fk_address_activity_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE CASCADE;
ALTER TABLE activity_address ADD CONSTRAINT fk_address_activity_activity FOREIGN KEY (activity_id) REFERENCES activity (activity_id) ON DELETE CASCADE;

