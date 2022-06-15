//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract StorageContract{
    //Defaults to 0
    // uint256 favoriteNumber;
    
    struct Person{
        string name;
        uint256 age;
    }

    Person[] people;
    mapping(string => uint256) public getPersonWithName;


    mapping (string => Person) public retrievePersonMap;
    
    
    function storePerson(string memory name, uint256 age) public {
        people.push(Person(name,age));
        getPersonWithName[name] = age;
        retrievePersonMap[name] = Person(name,age);
    }

    //It requires experimental ABIEncoderV2
    function getPerson(string memory _name) public view returns (Person memory) {
        return retrievePersonMap[_name];
    }    


    function getPersonFromIndex(uint256 index) public view returns(string memory name, uint256 age){
        return (people[index].name, people[index].age);
    }
}


