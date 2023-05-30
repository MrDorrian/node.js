module.exports.extractUsers = (users) => {
  return users
    .map(
      ({ name: { first, last }, email, gender, dob: { date , age} }) =>
        `('${first}', '${last}', '${email}', '${
          gender === "male"
        }', '${date}', '${(
          Math.random() + 1
        ).toFixed(2)}' ,'${age}')`
    )
    .join(", ");
};
