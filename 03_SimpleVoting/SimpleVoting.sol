// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    struct Voter {
        bool voted;
        uint8 vote;
    }

    mapping(address => Voter) public voters;
    uint256 public yesCount;
    uint256 public noCount;

    function vote(bool _voteYes) external {
        require(!voters[msg.sender].voted, "Already voted");

        voters[msg.sender].voted = true;
        if (_voteYes) {
            yesCount++;
            voters[msg.sender].vote = 1;
        } else {
            noCount++;
            voters[msg.sender].vote = 2;
        }
    }
}
