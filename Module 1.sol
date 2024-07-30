// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Voting {
    mapping(address => uint) public age;
    mapping(address => bool) public ownsVotingCard;

    function setAge(uint _age) public {
        require(_age > 0 && _age < 120, "Invalid age provided.");

        age[msg.sender] = _age;
    }

    function setVotingCard(bool _ownsCard) public {
        ownsVotingCard[msg.sender] = _ownsCard;
    }

    function checkEligibility() public view returns (bool) {
        uint userAge = age[msg.sender];
        bool userCard = ownsVotingCard[msg.sender];

        require(userAge > 0, "Age is not set.");

    
        if (userAge < 18) {
            revert("You are not eligible for a voting.");
        }

        assert(userCard == true);
        return true;
    }
}
