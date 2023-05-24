const express = require('express');
const yup = require('yup');
const app = express();
const bodyParser = express.json();
const port = 3000

const users =[];

app.get('*', (req, res) => {
    res.send(`Hello World! Is ${req.method} and ${req.path}`)
})

app.post('/createUser', bodyParser, async (req,res)=>{
        const { body } = req;
        const validationSchema = yup.object({
            name: yup.string().required(),
            age: yup.string().required(),
            email: yup.string().email().required(),
            gender: yup.string().required(),
            password: yup.string().required()});

        try {
            const validUser = await validationSchema.validate(body);
            validUser.id = Date.now();
            validUser.createdAt = new Date();
            users.push(validUser);
            delete validUser.password;
            console.log(users);
            res.send(validUser);
        } catch(err) {
               res.send(err.message) ;
            }
        }
)

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
