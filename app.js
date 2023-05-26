const express = require('express');
const validateBody = require('./middleware/validate.mw');
const {createUser, getAllUsers, updateUser, deleteUser,getUser} = require('./controller/userController');
const app = express();
const bodyParser = express.json();
const port = 8000;

app.get('/users', getAllUsers);
app.get('/user/:id',getUser);
app.post('/user', bodyParser, validateBody ,createUser);
app.patch('/user/:id',bodyParser , validateBody, updateUser);
app.delete('/user/:id', deleteUser);

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
