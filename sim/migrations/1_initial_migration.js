var Migrations = artifacts.require("./Migrations.sol");
var Take =  artifacts.require("./Take.sol");
module.exports = function(deployer) {
  deployer.deploy(Take);
};
