const { User } = require('../models');

module.exports.createUser = async (req,res)=>{
    try {
        const newUser = await new User(req.body);
        res.status(201).send(newUser);
    } catch (error) {
        res.status(400).send(error.message)
    }
}
