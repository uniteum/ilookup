// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/**
 *  @notice Events and errors for makers.
 */
interface IMaker {
    /**
     * @notice Emit when something is made.
     */
    event Made(address indexed home, bytes32 indexed salt);
}
