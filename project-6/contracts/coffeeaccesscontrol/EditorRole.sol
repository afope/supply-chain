pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'EditorRole' to manage this role - add, remove, check
contract EditorRole {
    using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  // Events 
  event EditorAdded(address indexed account);
  event EditorRemoved(address indexed account);

  // Define a struct 'editors' by inheriting from 'Roles' library, struct Role
    Roles.Role private editors;

  // In the constructor make the address that deploys this contract the 1st disteditoributor
  constructor() public {
    _addEditor(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyEditor() {
    require(isEditor(msg.sender));
    _;
  }

  // Define a function 'isEditor' to check this role
  function isEditor(address account) public view returns (bool) {
      return editors.has(account);
  }

  // Define a function 'addEditor' that adds this role
  function addEditor(address account) public onlyEditor {
      _addEditor(account);
  }

  // Define a function 'renounceEditor' to renounce this role
  function renounceEditor() public {
    _removeEditor(msg.sender);
  }

  // Define an internal function '_addEditor' to add this role, called by 'addEditor'
  function _addEditor(address account) internal {
      editors.add(account);
      emit EditorAdded(account);
  }

  // Define an internal function '_removeEditor' to remove this role, called by 'removeEditor'
  function _removeEditor(address account) internal {
      editors.remove(account);
      emit EditorRemoved(account);
  }
}