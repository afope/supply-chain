pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'CreatorRole' to manage this role - add, remove, check
contract CreatorRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event CreatorAdded(address indexed account);
  event CreatorRemoved(address indexed account);

  // Define a struct 'creators' by inheriting from 'Roles' library, struct Role
  Roles.Role private creators;

  // In the constructor make the address that deploys this contract the 1st creator
  constructor() public {
    _addCreator(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyCreator() {
    require(isCreator(msg.sender));
    _;
  }

  // Define a function 'isCreator' to check this role
  function isCreator(address account) public view returns (bool) {
    return creators.has(account);
  }

  // Define a function 'addCreator' that adds this role
  function addCreator(address account) public onlyCreator {
    _addCreator(account);
  }

  // Define a function 'renounceCreator' to renounce this role
  function renounceCreator() public {
    _removeCreator(msg.sender);
  }

  // Define an internal function '_addCreator' to add this role, called by 'addFarmer'
  function _addCreator(address account) internal {
    creators.add(account);
    emit CreatorAdded(account);
  }

  // Define an internal function '_removeCreator' to remove this role, called by 'removeFarmer'
  function _removeCreator(address account) internal {
    creators.remove(account);
    emit CreatorRemoved(account);
  }
}