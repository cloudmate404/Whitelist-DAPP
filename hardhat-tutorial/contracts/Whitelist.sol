//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {
    // maximum number of addresses which can be whitelisted
    uint8 public maxWhitelistedAddresses;

    // keep track of number of addresses whitelisted so far
    uint8 public numAddressesWhitelisted;

    // list of addresses which are whitelisted
    mapping (address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {

        require(!whitelistedAddresses[msg.sender], "Address already whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Whitelist is full");

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted += 1;
    }
}
