const db = new Map();

class User {
    constructor({name,email,gender,age}) {
        this.name=name;
        this.email=email;
        this.gender=gender;
        this.age=age;
        this.createdAt = new Date();
        this.id = `${db.size + 1}`;

        db.set(this.id, this);
        return Promise.resolve(this);
    }

    async update ({name,email,gender,age}) {
        db.set(this.id, {name,email,gender,age});
        return db.get(this.id);
    }
    async delete () {
        return db.delete(this.id)};
}

User.findAll = async () => {
    return [...db.values()]};
User.findOne = async (id) => {
    return db.get(id);
}

module.exports = User;


