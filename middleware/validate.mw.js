const yup = require("yup");
const validationSchema = yup.object({
    name: yup.string().required(),
    email: yup.string().email().required(),
    gender: yup.string().required(),
    age: yup.string().required()
});

module.exports = async (req,res,next)=> {
    try{
        req.body = await validationSchema.validate(req.body);
        next();
    } catch(err) {
        res.send(err.message) ;
    }
}
