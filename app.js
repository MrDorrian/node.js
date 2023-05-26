const express = require('express');
const validateBody = require('./middleware/validate.mw');
const {createUser, getAllUsers, updateUser, deleteUser} = require('./controller/userController');
const app = express();
const bodyParser = express.json();
const port = 8000;

app.get('/users', getAllUsers);
app.post('/createUser', bodyParser, validateBody ,createUser);
app.patch('/updateUser/:id',bodyParser , validateBody, updateUser);
app.delete('/deleteUser/:id', deleteUser);

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
