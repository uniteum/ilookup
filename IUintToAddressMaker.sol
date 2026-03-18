// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/// @notice Deploy a lookup contract from an array mapping uint to address.
interface IUintToAddressMaker {
    /// @notice Map a key such as a chainId to an address.
    struct KeyValue {
        uint256 key;
        address value;
    }

    /// @notice Predict the address of a lookup.
    /// @param keyValues The array of key value pairs sorted by key.
    /// @return exists Whether the lookup has already been deployed.
    /// @return home The predicted address of the lookup.
    /// @return salt The salt used to create the lookup. salt = keccak256(abi.encode(keyValues));
    function made(KeyValue[] memory keyValues) external view returns (bool exists, address home, bytes32 salt);

    /// @notice Create a lookup if it doesn't already exist.
    /// @param keyValues The array of key value pairs sorted by key.
    /// @return home The address of the new or existing lookup.
    function make(KeyValue[] memory keyValues) external returns (address home);

    /// @notice Emit when a lookup is created.
    /// @return home The address of the new lookup.
    /// @return salt The salt used to create the lookup. salt = keccak256(abi.encode(keyValues));
    event Made(address indexed home, bytes32 indexed salt);

    /// @notice Revert if someone tries to reinitialize an instance.
    error MadeAlready();
}
