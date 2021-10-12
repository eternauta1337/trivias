//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/*
 * IMPORTANT!
 * This code is extremely simplified in order to demo the issue discussed in trivia #2.
 * It is definitely NOT safe for usage in production in any way.
 * Use it to _understand_, not to copy paste into some project =P
 */

/*
 * NOTE 1:
 * These implementations don't deal with owner/admin protection at all, only with the location
 * of the upgradeability management functions. "Transparency" is a little more complicated once you start
 * restricting who can call "upgradeTo", and is completely ignored here.
 * Thus, you could argue that this illustrates the difference between "normal" unstructured storage proxies,
 * and universal proxies.
 */

// --------------------------------------------------------------------------------------------
// Basic proxying and upgradeability
// --------------------------------------------------------------------------------------------

/*
 * This is just a contract that stores the "implementation" address,
 * which will tell the proxy what contract contains its implementation or logic code.
 * It is stored at a seemingly random location, so that its storage slot
 * doesn't collide with any state variables declared in its implementations.
 */
contract ProxyStorage_t2 {
    struct ProxyNamespace {
        address implementation;
    }

    function _proxyStorage() internal pure returns (ProxyNamespace storage store) {
        assembly {
            store.slot := 0x9dbde58b6f7305fccdc5abd7ea1096e84de3f9ee47d83d8c3efc3e5557ac9c74
        }
    }
}

/*
 * This contract only forwards incoming calls to the implementation.
 * Solidity's internal function selector won't find a matching function, so any call
 * will end up in the fallback function, which contains some assembly wizardry to
 * simply forward the call as is to the implementation.
 * Notice the use of delegatecall. This means that all calls will use the code of the implementation
 * but in the context (storage, etc) of the proxy. This is what allows us to upgrade code
 * without losing state.
 */
contract Proxy_t2 is ProxyStorage_t2 {
    fallback() external {
        _forwardCallTo(
            _proxyStorage().implementation
        );
    }

    function _forwardCallTo(address implementation) private {
        assembly {
            calldatacopy(0, 0, calldatasize())

            let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)

            returndatacopy(0, 0, returndatasize())

            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }
}

/*
 * This contract exposes an upgradeability management function
 * that allows anyone to upgrade the implementation.
 * Normally, this would be access controlled by some modifier,
 * but we're keeping it simple here.
 */
contract UpgradeableProxy_t2 is ProxyStorage_t2 {
    function upgradeTo(address newImplementation) external {
        _proxyStorage().implementation = newImplementation;
    }
}

// --------------------------------------------------------------------------------------------
// Transparent Proxy
// --------------------------------------------------------------------------------------------

/*
 * Ok, here we go!
 * A transparent proxy can be seen as a proxy that can forward calls
 * to its implementation, and contains upgradeability management functions.
 */
contract TransparentProxy_t2 is Proxy_y2, UpgradeableProxy_t2 {}

/*
 * These are the implementation or logic contracts, versions 1 and 2.
 */
contract ImplementationV1_t2 {
    uint public value;

    function setValue(uint newValue) external {
        value = newValue;
    }
}
contract ImplementationV2_t2 {
    uint public value;
    address public addr;

    function setValue(uint newValue) external {
        value = newValue;
    }

    function setAddress(address addr) external {
        addr = newAddr;
    }
}

// --------------------------------------------------------------------------------------------
// Universal Proxy
// --------------------------------------------------------------------------------------------

/*
 * Look! A universal proxy is just a proxy with no upgradeability management functions =O!
 */
contract UniversalProxy_t2 is Proxy_t2 {}

/*
 * BUT its implementations do have the upgradeability management functions,
 * i.e. the upgradeTo(...) function that can write to the proxy storage namespace.
 */
contract UniversalImplementationV1_t2 is ImplementationV1_t2, UpgradeableProxy_t2 {}
contract UniversalImplementationV2_t2 is ImplementationV2_t2, UpgradeableProxy_t2 {}
