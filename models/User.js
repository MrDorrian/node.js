const { extractUsers } = require("../utils");

class User {
  static _client;
  static _tableName = "users";

  static async findAll() {
    return await this._client.query(`SELECT * FROM "${this._tableName}"`);
  }

  static async bulkCreate(users) {
    return await this._client.query(
      `INSERT INTO "users"(
        "first_name",
        "last_name",
        "email",
        "is_male",
        "birthday","height") VALUES ${extractUsers(users)};`
    );
  }
}

module.exports = User;
