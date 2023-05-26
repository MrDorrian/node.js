const db = new Map();

class User {
    constructor({name,email,gender,age}) {
        this.name=name;
        this.email=email;
        this.gender=gender;
        this.age=age;
        this.createdAt = new Date();
        this.id = db.size + 1;

        db.set(this.id, this);
        return Promise.resolve(this);
    }

    async update (name,email,gender,age) {
        db.set(this.id, {name,email,gender,age});
    }
    async delete () {
        return db.delete(this.id)};
}

User.findAll = async () => [...db.values()];
User.findOne = async (id) => db.get(id);

db.set ( 1,{
         name: "Mike",
         age: "37",
         gender: "male",
         email: "tes1@mail.com"
}).set(2,{
         name: "Edvard",
         age: "30",
         gender: "male",
         email: "tes2@mail.com"
});

module.exports = User;
