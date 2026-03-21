// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {IAddressLookup} from "./IAddressLookup.sol";

/**
 * @title IUniform — Uniform factory interface
 * @notice Factory pattern for deploying deterministic instances keyed by locale.
 */
interface IUniform {
    /**
     * @notice Checks whether an instance for the given locale has already been exists.
     * @param locale The locale lookup that resolves a chain-specific address.
     * @return exists `true` if the instance already exists.
     * @return home    The deterministic address of the instance.
     * @return salt    The CREATE2 salt derived from the locale.
     */
    function made(IAddressLookup locale) external view returns (bool exists, address home, bytes32 salt);

    /**
     * @notice Deploys a new instance for the given locale (or returns the existing one).
     * @param locale The locale lookup that resolves a chain-specific address.
     * @return instance The address of the (possibly pre-existing) instance.
     */
    function make(IAddressLookup locale) external returns (address instance);

    /**
     * @notice Emitted when a new instance is created via {make}.
     */
    event Made(address indexed instance, IAddressLookup locale);

    /**
     * @notice Caller is not authorized for this operation.
     */
    error Unauthorized();
}
