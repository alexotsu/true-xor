// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./TrueXOR.sol";

contract BoolGiver is IBoolGiver {
    function giveBool() public view override returns(bool _bool) {
        uint a = 1; // needed something to spend some gas so that the amount used per call would be an odd number. This is un-optimized but returns true
        assembly {
            _bool := shr(255, shl(255, gas())) // get one bit in leftmost location, then move bit to rightmost location so it is equivalent to a bool
        }
    }
}