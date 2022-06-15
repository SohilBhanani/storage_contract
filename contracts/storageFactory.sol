//SPDX-License-Identifier: MIT


pragma solidity ^0.6.0;
import './storage.sol';


contract StorageFactory{
    StorageContract[] public listOfStorage;

    function createStorage() public{
        StorageContract storageContract = new StorageContract();
        listOfStorage.push(storageContract);
    }


    function addPersonFromFactory(uint256 index, string memory name, uint256 age) public {
        StorageContract(address(listOfStorage[index])).storePerson(name,age);
    }


    function receivePersonFromFactory(uint256 index, uint256 innerIndex) public view returns(string memory name, uint256 age){
        return StorageContract(address(listOfStorage[index])).getPersonFromIndex(innerIndex);
    }


}