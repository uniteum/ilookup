// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/// @notice Deploy contracts that initializes via an array mapping uint to address.
interface IUintToAddressCloner {
    /// @notice Map a chainId to a local address.
    struct KeyValue {
        uint256 key;
        address value;
    }

    /// @notice Predict the address of a clone.
    /// @param keyValues The array of key value pairs sorted by key.
    /// @return exists Whether the clone has already been deployed.
    /// @return home The predicted address of the clone.
    /// @return salt The salt used to create the clone. salt = keccak256(abi.encode(keyValues));
    function made(KeyValue[] memory keyValues) external view returns (bool exists, address home, bytes32 salt);

    /// @notice Create a clone if it doesn't already exist.
    /// @param keyValues The array of key value pairs sorted by key.
    /// @return home The address of the new or existing clone.
    function make(KeyValue[] memory keyValues) external returns (address home);

    /// @notice Emit when a clone is created.
    /// @return home The address of the new clone.
    /// @return salt The salt used to create the clone. salt = keccak256(abi.encode(keyValues));
    event Made(address indexed home, bytes32 indexed salt);

    /// @notice Revert if someone tries to reinitialize an instance.
    error MadeAlready();
}
