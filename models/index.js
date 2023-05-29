const { Client } = require("pg");
const User = require("./User");

const config = {
  user: "postgres",
  password: "1234",
  host: "localhost",
  port: 5432,
  database: "test_db_new",
};

const db_client = new Client(config);

User._client = db_client;

module.exports = {
  User,
  client: db_client,
};
