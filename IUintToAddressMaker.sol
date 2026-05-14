// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

/**
 * @notice Make a lookup mapping uint256 to address.
 */
interface IUintToAddressMaker {
    /**
     * @notice Map a key to a value.
     */
    struct Entry {
        uint256 key;
        address value;
    }

    /**
     * @notice Predict the address of a lookup.
     * @param entries The array of key value pairs sorted by key.
     * @param variant Discriminator allowing distinct addresses for the same entries.
     * @return exists Whether the lookup already exists.
     * @return home The predicted address of the lookup.
     * @return salt The salt used to create the lookup.
     */
    function made(Entry[] memory entries, uint256 variant)
        external
        view
        returns (bool exists, address home, bytes32 salt);

    /**
     * @notice Create a lookup if it doesn't already exist.
     * @param entries The array of key value pairs sorted by key.
     * @param variant Discriminator allowing distinct addresses for the same entries.
     * @return home The address of the new or existing lookup.
     */
    function make(Entry[] memory entries, uint256 variant) external returns (address home);
}
