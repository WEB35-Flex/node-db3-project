// scheme-model
const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  return db("steps as s")
    .join("schemes as sch", "sch.id", "s.scheme_id")
    .select("s.id", "sch.scheme_name", "s.step_number", "s.instructions")
    .where("s.scheme_id", id)
    .orderBy("s.step_number");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then((id) => {
      return findById(id[0]);
    });
}

function update(changes, id) {
  return db("schemes").where({ id }).update(changes);
}

function remove(id) {
  return db("schemes").where("id", id).del();
}
