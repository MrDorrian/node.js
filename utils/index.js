module.exports.extractUsers = (users) => {
  return users
    .map(
      ({ name: { first, last }, email, gender, dob: { date , age} }) =>
        `('${first}', '${last}', '${email}', '${
          gender === "male"
        }', '${date}', '1.8' ,'${age}')`
    )
    .join(", ");
};
