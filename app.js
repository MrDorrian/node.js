const express = require('express');
const validateBody = require('./middleware/validate.mw');
const {createUser} = require('./controller/userController');
const app = express();
const bodyParser = express.json();
const port = 8000;

app.post('/createUser', bodyParser, validateBody ,createUser);

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
