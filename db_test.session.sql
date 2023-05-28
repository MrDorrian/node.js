DROP TABLE "users";
CREATE TABLE "users" (
    id serial PRIMARY KEY,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
    email varchar(256) NOT NULL UNIQUE CHECK (email != ''),
    is_male boolean NOT NULL DEFAULT FALSE,
    birthday date NOT NULL,
    height numeric(3,2) NOT NULL CHECK (height > 0.2 AND height < 2.7),

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
        1.58
    );