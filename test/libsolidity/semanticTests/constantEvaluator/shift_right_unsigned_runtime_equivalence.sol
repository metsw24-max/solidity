// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

uint256 constant TWO = 1;
uint8 constant U8_128 = 128;
uint8 constant U8_240 = 240; // 1111 0000

contract C {
    uint256 constant LITERAL_WRAP = 1 >> TWO;
    uint[LITERAL_WRAP + 1] a;
    uint8 constant CONST_NO_WRAP = U8_240 >> 4;
    uint[CONST_NO_WRAP] b;
    uint constant CONST_WRAP = TWO >> 3;
    uint[CONST_WRAP + 1] c;

    function testLiteralWrapEquivalence() public view returns (bool) {
        uint256 runtimeResult = 1 >> TWO;
        return
            LITERAL_WRAP == runtimeResult &&
            a.length == 1;
    }

    function testConstNoWrapEquivalence() public view returns (bool) {
        uint8 runtimeResult = U8_240 >> 4;
        return
            CONST_NO_WRAP == runtimeResult &&
            b.length == runtimeResult;
    }

    function testConstWrapEquivalence() public view returns (bool) {
        uint runtimeResult = TWO >> 3;
        return
            CONST_WRAP == runtimeResult &&
            c.length == 1;
    }
}
// ----
// testLiteralWrapEquivalence() -> true
// testConstNoWrapEquivalence() -> true
// testConstWrapEquivalence() -> true
