// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract NoContract {
    function isContract(address addr) public view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(addr)
        }
        return size > 0;
    }

    modifier noContract() {
        require(!isContract(msg.sender), "no contract allowed");
        _;
    }

    bool public pwned = false;

    fallback() external noContract {
        pwned = true;
    }
}