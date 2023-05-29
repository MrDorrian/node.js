DROP TABLE "users";
CREATE TABLE "users" (
    id UUID PRIMARY KEY,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
    email varchar(256) NOT NULL UNIQUE CHECK (email != ''),
    is_male boolean NOT NULL DEFAULT FALSE,
    birthday date NOT NULL,
    height numeric(3, 2) NOT NULL CHECK (
        height > 0.2
        AND height < 2.7
    ),
    CONSTRAINT "users_birthday" CHECK (
        birthday < current_date
        AND birthday > '1/1/1900'
    ),
    CONSTRAINT "full_name" CHECK (
        first_name != ''
        AND last_name != ''
    )
);
INSERT INTO "users" (
        "first_name",
        "last_name",
        "email",
        "is_male",
        "birthday",
        "height"
    )
VALUES (
        'Max',
        'Dundukov',
        'email@gmail.com',
        true,
        '09/09/1993',
        1.80
    ),
    (
        'Max',
        'Dundukov',
        'emailnew@gmail.com',
        true,
        '09/09/1993',
        1.70
    ),
    (
        'Anna',
        'Dundukov',
        'anna@gmail.com',
        false,
        '09/27/1990',
        1.58);
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
VALUES (1, 1,2),(1, 2, 5),
    (1, 3, 6),
    (1, 4, 2),
    (1, 5, 1)
