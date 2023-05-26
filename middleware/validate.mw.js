const yup = require("yup");
module.exports = async (req,res,next)=> {
    const validationSchema = yup.object({
        name: yup.string().required(),
        email: yup.string().email().required(),
        gender: yup.string().required(),
        age: yup.string().required()
    });
    try{
        req.body = await validationSchema.validate(req.body);
        next();
    } catch(err) {
        res.send(err.message) ;
    }
}
