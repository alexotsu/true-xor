// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TrueXOR.sol";
import "../src/BoolGiver.sol";

contract XorTest is Test {
    TrueXOR public trueXOR;
    BoolGiver public boolGiver;

    function setUp() public {
        boolGiver = new BoolGiver();
        trueXOR = new TrueXOR();
    }

    function testCallMe() public {
        vm.prank(msg.sender);
        bool returned = trueXOR.callMe(address(boolGiver));
        assertTrue(returned);
    }
}
