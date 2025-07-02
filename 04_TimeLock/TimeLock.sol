// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLock {
    uint256 public unlockTime;
    address public owner;

    constructor(uint256 _unlockTime) payable {
        require(_unlockTime > block.timestamp, "Unlock time must be in the future");
        unlockTime = _unlockTime;
        owner = msg.sender;
    }

    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        require(block.timestamp >= unlockTime, "Cannot withdraw yet");
        payable(owner).transfer(address(this).balance);
    }
}
