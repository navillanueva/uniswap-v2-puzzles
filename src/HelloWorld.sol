// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./interfaces/IERC20.sol";

contract HelloWorld {
    /**
     *  HELLO WORLD EXERCISE
     *
     *  The contract returns Hello World string.
     *
     */

    string public name = "Hello World";

    function sayHelloWorld(address) public view returns (string memory) {
        return this.name();
    }
}
