DROP TABLE "users";
CREATE TABLE "users" (
    id serial CONSTRAINT "PK_USER" PRIMARY KEY,
    first_name varchar(64) NOT NULL CONSTRAINT "CK_FN_NOT_EMPTY" CHECK (first_name != ''),
    last_name varchar(64) NOT NULL CHECK (last_name != ''),
    email varchar(256) NOT NULL UNIQUE CHECK (email != ''),
    is_male boolean NOT NULL DEFAULT FALSE,
    birthday date NOT NULL CONSTRAINT "CK_BD_NOT_AFTER_TODAY" CHECK (birthday < current_date),
    age decimal NOT NULL
);

ALTER TABLE "users"
ADD COLUMN "is_banned" boolean NOT NULL DEFAULT FALSE; 

INSERT INTO "users" (
        "first_name",
        "last_name",
        "email",
        "is_male",
        "birthday",
        "age"
    )
VALUES (
        'Max',
        'Dundukov',
        'email@gmail.com',
        true,
        '09/09/1993',
        30
    ),
    (
        'Max',
        'Dundukov',
        'emailnew@gmail.com',
        true,
        '09/09/1993',
        30
    ),
    (
        'Anna',
        'Dundukov',
        'anna@gmail.com',
        false,
        '09/27/1993',
        28
    );