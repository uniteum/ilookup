// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/**
 *  @notice Map a single predictable contract address to a chain-specific string.
 */
/**
 * @dev This deterministic lookup pattern enables the creation of immutable contracts
 * at deterministic addresses even if they depend on initialization data that varies by chain.
 */
interface IStringLookup {
    /**
     * @return local string for the current chain.
     */
    function value() external view returns (string memory local);
}
