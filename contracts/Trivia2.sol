//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/*
 * IMPORTANT!
 * This code is over simplified to demo the issue discussed in trivia #2
 * and is not safe enough for use in production. Use it to _understand_,
 * and not to copy paste into some project =P
 */

// --------------------------------------------------------------------------------------------
// Basic proxing and upgradeability
// --------------------------------------------------------------------------------------------

// contract ProxyStorage_t2 {
//     struct ProxyNamespace {
//         address implementation;
//     }

//     function _proxyStorage() internal pure returns (ProxyNamespace storage store) {
//         assembly {
//             store.slot := 0x9dbde58b6f7305fccdc5abd7ea1096e84de3f9ee47d83d8c3efc3e5557ac9c74
//         }
//     }
// }

// contract Proxy_t2 is ProxyStorage_t2 {
//     fallback() {
//         _forwardCallTo(
//             _proxyStorage().implementation
//         );
//     }

//     function _forwardCallTo(address implementation) {
//         assembly {
//             calldatacopy(0, 0, calldatasize())

//             let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)

//             returndatacopy(0, 0, returndatasize())

//             switch result
//             case 0 {
//                 revert(0, returndatasize())
//             }
//             default {
//                 return(0, returndatasize())
//             }
//         }
//     }
// }

// contract UpgradeableProxy_t2 {
//     function upgradeTo(address newImplementation) {
//         _proxyStorage().implementation = newImplementation;
//     }
// }

// --------------------------------------------------------------------------------------------
// Transparent Proxy
// --------------------------------------------------------------------------------------------

// contract Trivia2_TransparentProxy is Trivia2_Proxy, Trivia2_UpgradeableProxy {}

// contract Trivia2_ImplementationV1 {
//     uint public value;

//     function setValue(uint newValue) external {
//         value = newValue;
//     }
// }

// contract Trivia2_ImplementationV2 {
//     uint public value;
//     address public addr;

//     function setValue(uint newValue) external {
//         value = newValue;
//     }

//     function setAddress(address addr) external {
//         addr = newAddr;
//     }
// }

// --------------------------------------------------------------------------------------------
// Universal Proxy
// --------------------------------------------------------------------------------------------

// contract Trivia2_UniversalProxy is Trivia2_Proxy {}

