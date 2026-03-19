// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {IMaker} from "./IMaker.sol";

/// @notice Make a lookup mapping uint256 to address.
interface IUintToAddressMaker is IMaker {
    /// @notice Map a key to a value.
    struct KeyValue {
        uint256 key;
        address value;
    }

    /// @notice Predict the address of a lookup.
    /// @param keyValues The array of key value pairs sorted by key.
    /// @return exists Whether the lookup already exists.
    /// @return home The predicted address of the lookup.
    /// @return salt The salt used to create the lookup. salt = keccak256(abi.encode(keyValues));
    function made(KeyValue[] memory keyValues) external view returns (bool exists, address home, bytes32 salt);

    /// @notice Create a lookup if it doesn't already exist.
    /// @param keyValues The array of key value pairs sorted by key.
    /// @return home The address of the new or existing lookup.
    function make(KeyValue[] memory keyValues) external returns (address home);
}
