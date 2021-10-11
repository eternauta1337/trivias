//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Trivia1_A {
    event SenderRecorded(address sender);

    function method1(Trivia1_B b) external {
        address sender = b.run();

        emit SenderRecorded(sender);
    }

    function method2(Trivia1_B b) external {
        (bool success, bytes memory response) = address(b).call(abi.encodeWithSignature("run()"));

        if (success) {
            address sender = _bytesToAddress(response);

            emit SenderRecorded(sender);
        }
    }

    function method3(Trivia1_B b) external {
        (bool success, bytes memory response) = address(b).delegatecall(abi.encodeWithSignature("run()"));

        if (success) {
            address sender = _bytesToAddress(response);

            emit SenderRecorded(sender);
        }
    }

    function _bytesToAddress(bytes memory data) private pure returns (address addr) {
        assembly {
            addr := mload(add(data, 32))
        }
    }
}

contract Trivia1_B {
    function run() public view returns (address) {
        if (block.number % 2 == 0) {
            revert("Nope!");
        }

        return msg.sender;
    }
}
