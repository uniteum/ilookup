// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

/**
 * @notice Map a single predictable contract address to a chain-specific string.
 */
interface IStringLookup {
    /**
     * @return local string for the current chain.
     */
    function value() external view returns (string memory local);
}
