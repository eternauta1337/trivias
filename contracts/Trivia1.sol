//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract ContractA_t1 {
    event SenderRecorded(address sender);

    function method1(ContractB_t1 b) external {
        address sender = b.run();

        emit SenderRecorded(sender);
    }

    function method2(ContractB_t1 b) external {
        (bool success, bytes memory response) = address(b).call(abi.encodeWithSignature("run()"));

        if (success) {
            address sender = _bytesToAddress(response);

            emit SenderRecorded(sender);
        }
    }

    function method3(ContractB_t1 b) external {
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

contract ContractB_t1 {
    function run() public view returns (address) {
        if (block.number % 2 == 0) {
            revert("Nope!");
        }

        return msg.sender;
    }
}
