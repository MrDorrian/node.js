const { loadUsers } = require("./configs/api");
const { User, client } = require("./models");

(async () => {
  client.connect();
  const users = await loadUsers();
  const result = await User.bulkCreate(users);
  console.log(result);
  await client.end();
})();
