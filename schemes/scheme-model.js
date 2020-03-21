const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  getSteps,
  add,
  update,
  remove
};

function find() {
  return db("schemes");
}

function getSteps() {
  return db("steps");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first();
}

function findSteps(schemeId) {
  return db("schemes")
    .join("steps as s", "s.scheme_id", "schemes.id")
    .select("schemes.scheme_name", "s.instructions", "s.step_number")
    .where({ scheme_id: schemeId })
    .orderBy("s.step_number");
}

function add(newScheme) {
  return db("schemes").insert(changes);
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(() => {
      return findById(id);
    });
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .del();
}
