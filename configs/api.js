const axios = require("axios");
const http = axios.create({
  baseURL: "https://randomuser.me/api/",
});
module.exports.loadUsers = async () => {
  const {
    data: { results },
  } = await http.get("?results=1000&seed=dorrian");
  return results;
};
