DROP TABLE "users";
CREATE TABLE "users" (
    id serial PRIMARY KEY,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
    email varchar(256) NOT NULL UNIQUE CHECK (email != ''),
    is_male boolean NOT NULL DEFAULT FALSE,
    birthday date NOT NULL,
    height numeric(3, 2) NOT NULL CHECK (
        height > 0.2
        AND height < 2.7
    ),
    age int NOT NULL,
    CONSTRAINT "users_birthday" CHECK (
        birthday < current_date
        AND birthday > '1/1/1900'
    ),
    CONSTRAINT "full_name" CHECK (
        first_name != ''
        AND last_name != ''
    )
);
DROP TABLE "products";
CREATE TABLE "products" (
    "id" serial PRIMARY KEY,
    "name" varchar(64) NOT NULL CHECK ("name" != ''),
    "price" decimal(12, 2) NOT NULL CHECK ("price" > 0),
    "quantity" int NOT NULL CHECK("quantity" > 0)
);
DROP TABLE "orders";
CREATE TABLE "orders"(
    "id" bigserial PRIMARY KEY,
    "customer_id" int REFERENCES "users"("id"),
    "isDone" boolean DEFAULT false,
    "created_at" timestamp DEFAULT current_timestamp
);
DROP TABLE "products_to_orders";
CREATE TABLE "products_to_orders" (
    "order_id" int REFERENCES "orders" ("id"),
    "product_id" int REFERENCES "products" ("id"),
    "quantity" int NOT NULL CHECK ("quantity" > 0),
    PRIMARY KEY ("order_id", "product_id")
);
INSERT INTO "products" ("name", "price", "quantity")
VALUES ('apple', 1000, 10),
    ('apple_13', 1500, 14),
    ('apple_14', 1800, 18),
    ('nokia', 900, 6),
    ('samsung', 900, 6),
    ('xiaomi', 900, 63)
INSERT INTO "orders" ("customer_id")
VALUES(2);
INSERT INTO "products_to_orders" ("order_id", "product_id", "quantity")
VALUES (1, 1, 2),
    (1, 2, 5),
    (1, 3, 6),
    (1, 4, 2),
    (1, 5, 1);
ALTER TABLE "users"
ADD COLUMN "weight" int CHECK (
        "weight" BETWEEN 0 AND 300
    );
/*
 */
UPDATE "users"
SET "weight" = 75
WHERE "is_male" = false
RETURNING *;
/*
 */
DELETE FROM "users"
WHERE "id" = 400;
/*
 */
SELECT *
FROM "users"
LIMIT 100 OFFSET 10;
/*
 */
SELECT *
FROM "users"
WHERE extract(
        'month'
        from "birthday"
    ) = 9
    AND extract(
        'day'
        from "birthday"
    ) = 1;
/**/
SELECT "first_name" AS "Name",
    "last_name" AS "Surname",
    "email" AS "Mail"
FROM "users" AS "U";
/*
 */
SELECT concat ("first_name", ' ', "last_name") AS "Full Name"
FROM "users";
/*
 */
SELECT *,
    CHARACTER_LENGTH (concat("first_name", ' ', "last_name")) AS "Full Name"
FROM "users"
WHERE CHARACTER_LENGTH(concat("first_name", ' ', "last_name")) < 15;
/*  
 CRUD 
 CREATE - Insert
 READ -SELECT
 UPDATE - UPDATE
 DELETE - DELETE
 */
INSERT INTO "users"
VALUES ()
RETURNING *;
-- 
DROP TABLE "workers";
CREATE TABLE "workers" (
    "id" serial PRIMARY KEY,
    "birthday" date NOT NULL,
    "name" varchar(64) NOT NULL CHECK ("name" != ''),
    "salary" decimal NOT NULL DEFAULT 0
);
/*
 */
INSERT INTO "workers" ("birthday", "name", "salary")
VALUES ('1991-03-25', 'Kirill', 600),
    ('1997-04-12', 'Maks', 4000),
    ('1994-09-01', 'Anna', 1800),
    ('2000-02-05', 'Sviato', 1000)
RETURNING *;
/*
 */
SELECT *
from "workers"
WHERE "name" = 'Petr';
/*
 */
UPDATE "workers"
SET "salary" = 200
WHERE "name" = 'Petr'
RETURNING *;
/*
 */
UPDATE "workers"
SET "birthday" = age(timestamp '1991-03-13')
WHERE "id" = 4
RETURNING *;
/*
 */
UPDATE "workers"
SET "salary" = 700
WHERE "salary" < 500
RETURNING *;
/*
 */
UPDATE "workers"
SET "salary" = 700
WHERE "salary" < 500
RETURNING *;
/*
 */
UPDATE "workers"
SET "birthday" = '1900-01-01'
WHERE "id" BETWEEN 2 AND 5
RETURNING *;
/*
 */
UPDATE "workers"
SET "salary" = 900,
    "name" = 'Vasya'
WHERE "name" = 'Yugenii'
RETURNING *;
/*
 */
SELECT *
FROM "workers"
WHERE "salary" > 400;
/*
 */
SELECT "salary",
    date_part('year', age("birthday"))
FROM "workers"
WHERE "name" = 'Vasya';
/*
 */
SELECT *
FROM "workers"
WHERE "name" != 'Petr';
/*
 */
-- Workers with salary 1000 or age 27
SELECT *
FROM "workers"
WHERE "salary" = 1000
    OR date_part('year', age("birthday")) = 27;
--
SELECT *
FROM "workers"
WHERE extract(
        year
        from age("birthday")
    ) = 15
    OR extract(
        year
        from age("birthday")
    ) = 23;
--  
SELECT *
FROM "workers"
WHERE extract('year' from age("birthday")) BETWEEN 15 AND 25;
----------------------------------------------------------------
--Средний рост пользователей
SELECT avg("height")
FROM "users";
--Средний рост man and woman
SELECT avg("height"),
    "is_male"
FROM "users"
GROUP BY "is_male";
--min height man and woman
SELECT min("height"),
    "is_male"
FROM "users"
GROUP BY "is_male";
--min/max/avg height man and woman
SELECT avg("height"),
    max("height"),
    min("height"),
    "is_male"
FROM "users"
GROUP BY "is_male";
--count people birth at 1970-01-01
SELECT count(*)
FROM "users"
WHERE "birthday" = '1965-10-01';
--count people with NAME = ...
SELECT count(*)
FROM "users"
WHERE "first_name" = 'Amelia';
--count people with age between 20 and 30
SELECT count(*)
FROM "users"
WHERE extract('year' from age("birthday")) BETWEEN 20 AND 30;
--check if there are users with id 
SELECT *
FROM "users"
WHERE "id" IN (300,200,145,654);