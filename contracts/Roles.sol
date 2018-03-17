pragma solidity ^0.4.18;

contract Roles {

    // Note, I'm using a bytes32 type for the role name instead 
    // of string because currently you can't used dynamically sized types
    // like `string` as the key for a mapping. 
    // That does mean that role names need to be 32 characters or less
    // in length
    // Im using bytes32 for the description as well so I can easily 
    // set the description equal to the role name if no description was 
    // supplied.  I didn't really need the description anyway.  It's
    // Just there so I can use the mapping to store role names. 
    mapping(bytes32 => bytes32) public roles;

    mapping(address => bytes32) public memberships;

    function Roles() public {

    }

    function addRole(bytes32 _role) public {
      // Add the role name as both the key and the value
      roles[_role] = _role;
    }

    function assignRole(address _address, bytes32 _role) public {
      // If the role's value has no length, 
      // assume the role doesn't exist, and abort the assignment
      require(roles[_role].length > 0);

      // Otherwise, assign the role to the address
      memberships[_address] = _role;

    }

}