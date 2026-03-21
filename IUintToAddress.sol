// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/**
 *  @notice Mapping from uint256 to address.
 */
interface IUintToAddress {
    /**
     * @return total number of keys in the map.
     */
    function length() external view returns (uint256);

    /**
     * @dev Index must be less than {length}.
     * @param index The position in the key list.
     * @return key at the specified index.
     */
    function keyAt(uint256 index) external view returns (uint256 key);

    /**
     * @param key The key to look up.
     * @return value mapped to the given key or zero address if not found.
     */
    function valueOf(uint256 key) external view returns (address value);
}
