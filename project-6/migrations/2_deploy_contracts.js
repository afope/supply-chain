// migrating the appropriate contracts
var CreatorRole = artifacts.require("./CreatorRole.sol");
var EditorRole = artifacts.require("./EditorRole.sol");
var ConsumerRole = artifacts.require("./ConsumerRole.sol");
var SupplyChain = artifacts.require("./SupplyChain.sol");

module.exports = function(deployer) {
  deployer.deploy(CreatorRole);
  deployer.deploy(EditorRole);
  deployer.deploy(ConsumerRole);
  deployer.deploy(SupplyChain);
};
