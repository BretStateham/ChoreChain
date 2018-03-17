var Roles = artifacts.require("./Roles.sol");
var Chore = artifacts.require("./Chore.sol");

module.exports = function(deployer, network, accounts) {
  deployer.deploy(Roles).then(()=>{
      return Roles.deployed(); 
  }).then((roles)=> {
    // var roles = Roles.deployed();
    console.log(roles);
    //roles.addRole("Parent");
    roles.addRole(web3.fromAscii("Parent"));
    roles.addRole("Child");
    roles.assignRole(accounts[0],"Parent", {from: accounts[0]});
    roles.assignRole(accounts[1],"Parent", {from: accounts[0]});
    roles.assignRole(accounts[2],"Child", {from: accounts[0]});
    roles.assignRole(accounts[3],"Child", {from: accounts[0]});
  });
};
