// const express = require('express');
// const validateBody = require('./middleware/validate.mw');
// const {createUser, getAllUsers, updateUser, deleteUser,getUser} = require('./controller/userController');
// const app = express();
// const bodyParser = express.json();
// const port = 8000;

// app.get('/users', getAllUsers);
// app.get('/user/:id',getUser);
// app.post('/user', bodyParser, validateBody ,createUser);
// app.patch('/user/:id',bodyParser , validateBody, updateUser);
// app.delete('/user/:id', deleteUser);

// app.listen(port, () => {
//     console.log(`Example app listening on port ${port}`);
// });

const { Client } = require('pg');
const config = {
  user: 'postgres',
  password: '1234',
  host: 'localhost',
  port: 5432,
  database: 'test_db_new'
};
const db_client = new Client(config);

(async () => {
  await db_client.connect();
  await db_client.query(`CREATE TABLE "from_node_js"(id serial PRIMARY KEY);`);
  await db_client.end();
})();
