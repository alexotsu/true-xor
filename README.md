# True XOR

From the Quill CTF "[True XOR](https://quillctf.super.site/challenges/quillctf-challenges/true-xor)" challenge

## Approach
Initially, I thought having a simple persistent state variable in **BoolGiver** would do the trick; flip it to true once it had been called once, then flip it to false when it gets called again. This obviously didn't work as it was modifying the state of a contract, thus violating the `view` property of **callMe**.

**BoolGiver** had no way of knowing whether it was being called for the first or second time, and since it was being called in the same function, many other block-level indicators of time passage like timestamp or blockhash would be the same. So I knew I needed a value that would change _during_ the transaction. The `gas` keyword was exactly that.

By having the `gas` be odd at one call and even at the other, I could convert the last bit (0 or 1) into a bool value, which causes different values to be returned for the same function call. It didn't use XOR, but still achieved the correct result.