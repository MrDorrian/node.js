DROP TABLE "users";
CREATE TABLE "users" (
    first_name varchar(64) NOT NULL CHECK (first_name != ''),
    last_name varchar(64) NOT NULL CHECK (last_name != ''),
    email varchar(256) NOT NULL UNIQUE CHECK (email != ''),
    is_male boolean NOT NULL,
    birthday date NOT NULL CHECK (birthday < current_date),
    age decimal NOT NULL
);
INSERT INTO "users"
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
DROP TABLE "messages";

CREATE TABLE "messages" (
    "id" bigserial PRIMARY KEY,
    "body" varchar(5000) NOT NULL CHECK("body" != ''),
    "author" varchar(128) NOT NULL CHECK("author" != ''),
    "created_at" timestamp NOT NULL DEFAULT current_timestamp
);

INSERT INTO "messages" ("author", "body")
VALUES ('test_user', 'Test_Body 1'),
('test_user1', 'Test_Body 2'),
('test_user2', 'Test_Body 3');