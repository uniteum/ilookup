// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/// @notice Make a lookup mapping uint256 to uint256.
interface IUintToUintMaker {
    /// @notice Map a key to a value.
    struct KeyValue {
        uint256 key;
        uint256 value;
    }

    /// @notice Predict the address of a lookup.
    /// @param keyValues The array of key value pairs sorted by key.
    /// @return exists Whether the lookup already exists.
    /// @return home The predicted address of the contract.
    /// @return salt The salt used to create the clone. salt = keccak256(abi.encode(kvs));
    function made(KeyValue[] memory keyValues) external view returns (bool exists, address home, bytes32 salt);

    /// @notice Create a lookup if it doesn't already exist.
    /// @param keyValues The array of key value pairs sorted by key.
    /// @return home The deployed address of the mapping.
    function make(KeyValue[] memory keyValues) external returns (address home);

    /// @notice Emit when a lookup is made.
    event Made(address indexed home, bytes32 indexed salt);

    /// @notice Revert if someone tries to reinitialize an instance.
    error Unauthorized();
}
