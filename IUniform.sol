// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {IAddressLookup} from "./IAddressLookup.sol";

/// @title IUniform — Uniform token factory interface
/// @notice Defines the factory pattern for deploying deterministic uniform token clones.
interface IUniform {
    /// @notice Checks whether a uniform token for the given locale has already been deployed.
    /// @param locale The locale lookup for the underlying token.
    /// @return deployed `true` if the clone already exists.
    /// @return home    The deterministic address of the clone.
    /// @return salt    The CREATE2 salt derived from the locale.
    function made(IAddressLookup locale)
        external
        view
        returns (bool deployed, address home, bytes32 salt);

    /// @notice Deploys a new uniform token clone (or returns the existing one).
    /// @param locale The locale lookup for the underlying token.
    /// @return token  The address of the (possibly pre-existing) uniform token.
    function make(IAddressLookup locale) external returns (address token);

    /// @notice Emitted when a new uniform token clone is created via {make}.
    event Made(address indexed token, IAddressLookup locale);

    /// @notice Caller is not authorized for this operation.
    error Unauthorized();
}
