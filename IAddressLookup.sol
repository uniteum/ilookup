// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

/**
 * @notice Map a single predictable contract address to a chain-specific address.
 */
interface IAddressLookup {
    /**
     * @return local address for the current chain.
     */
    function value() external view returns (address local);
}
