// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/**
 *  @notice Map a single predictable contract address to a chain-specific address.
 */
/**
 * @dev This deterministic lookup pattern enables the creation of immutable contracts
 * at deterministic addresses even if they depend on initialization data that varies by chain.
 */
interface IAddressLookup {
    /**
     * @return local address for the current chain.
     */
    function value() external view returns (address local);
}
