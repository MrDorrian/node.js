const { User } = require('../models');

module.exports.createUser = async (req,res) => {
    try {
        const newUser = await new User(req.body);
        res.status(201).send(newUser);
    } catch (error) {
        res.status(400).send(error.message)
    }
};

module.exports.getAllUsers = async (req,res) => {
    try {
        const allUsers = await User.findAll();
        res.status(200).send(allUsers);
    } catch (error) {
        res.status(400).send(error.message)
    }
};

module.exports.updateUser = async (req,res) => {
    try {
        const {params:{id}, body} = req;
        const foundUser = await User.findOne(id);
        const updatedUser = await foundUser.update(body);
        const responseUser = JSON.stringify(updatedUser);

        res.status(202).end(responseUser);
    } catch (error) {
        res.status(400).send(error.message)
    }
};

module.exports.getUser = async (req,res) => {
    try {
        const {params:{id}} = req;
        const foundUser = await User.findOne(id);
        if (foundUser) {
          return  res.status(200).send(foundUser);
        }
        res.status(400).send(`User not found with id ${id}`);
    } catch (error){
        res.status(400).send(error.message)
    }
};

module.exports.deleteUser = async (req,res) => {
    try {
        const {params:{id}} = req;
        const foundUser = await User.findOne(id);
        const deletedUser = foundUser.delete();
        res.status(200).send(deletedUser);
    } catch (error){
        res.status(400).send(error.message)
    }
};
