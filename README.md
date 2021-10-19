# Solidity Trivias

This repo contains condensed demos and explanations for the Solidity trivias being shared on twitter via the profile: https://twitter.com/the_ethernaut

## Running the examples

1) Clone the repo: `git clone git@github.com:ajsantander/trivias.git`
2) Move to the folder: `cd trivias`
3) Install hardhat and dependencies: `npm install`

## Trivias

### Solidity Trivia #1:

"How would you call a function on a third party contract B, on behalf of the sender, through your contract A, guaranteeing no reverts?"

* Question thread: [Solidity trivia #1 discussion](https://twitter.com/the_ethernaut/status/1442091740886880257?s=20)
* Explanation thread: [Solidity trivia #1 explanation](https://twitter.com/the_ethernaut/status/1447580216017231872?s=20)
* Demo contracts: `contracts/Trivia1.sol`
* Demo tests: `npx hardhat test test/Trivia1.test.js`

### Solidity Trivia #2:

"What’s the main difference between a transparent proxy and a universal proxy?"

* Question thread: [Solidity trivia #2 discussion](https://twitter.com/the_ethernaut/status/1442094655324098563)
* Explanation thread: [Solidity trivia #2 explanation](https://twitter.com/the_ethernaut/status/1447894121050431489?s=20)
* Demo contracts: `contracts/Trivia2.sol`
* Demo tests: `npx hardhat test test/Trivia2.test.js`

### Solidity Trivia #3:

"How could you destroy the implementation of, and effectively brick, a universal proxy?

Assumptions:
You re not the owner of the proxy
No one owns the implementation
The implementation uses delegatecall to guarantee that the next implementation is not sterile"

* Question thread: [Solidity trivia #3 discussion](https://twitter.com/the_ethernaut/status/1442190429340975112?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #4:

"What’s the danger of using tx.origin for user authentication in a smart contract?"

* Question thread: [Solidity trivia #4 discussion]()
* Explanation thread: [TBD](https://twitter.com/the_ethernaut/status/1442232362503393280?s=20)
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #5:

"What kind of proxy would you use to update an indefinite amount of instances with a single implementation upgrade? And how would it work?"

* Question thread: [Solidity trivia #5 discussion](https://twitter.com/the_ethernaut/status/1442323767573680128?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #6:

"Whats the deal with external vs public? When should you use external? When not? Why is it cheaper than public?"

* Question thread: [Solidity trivia #6 discussion](https://twitter.com/the_ethernaut/status/1442468598799237130?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #7:

"3rd party contract B with function b() writes to state in ways outside of your control.

How would you simulate a call to b() from your contract A, observe the side effects, and then undo them entirely without reverting the main execution thread?"

* Question thread: [Solidity trivia #7 discussion](https://twitter.com/the_ethernaut/status/1442638775583186944?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #8:

"Dynamically sized types in function signatures may be preceded by the keywords “memory”, “storage”, or “calldata”. When is it optimal to use each of them?"

* Question thread: [Solidity trivia #8 discussion](https://twitter.com/the_ethernaut/status/1442986744664711169?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #9:

"Why do contract sizes decrease so much when you wrap the code of a modifier in an internal function?"

* Question thread: [Solidity trivia #9 discussion](https://twitter.com/the_ethernaut/status/1444084861787062280?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #10:

"Is there a way to revert with dynamic error messages?

I.e. “Error: Price must be > 1 ETH”, where 1 is a value held in a state variable in your contract."

* Question thread: [Solidity trivia #10 discussion](https://twitter.com/the_ethernaut/status/1444305783525609479?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #11:

"Can you read a private variable of another contract from your contract? If so, how?"

* Question thread: [Solidity trivia #11 discussion](https://twitter.com/the_ethernaut/status/1444417121933475844?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #12:

"Bob calls contract A, which delegate calls contract B, which delegate calls contract C, which calls contract D, which delegate calls contract E, which delegate calls contract A.

Who is msg.sender when the execution reaches back contract A?"

* Question thread: [Solidity trivia #12 discussion](https://twitter.com/the_ethernaut/status/1445465680669601800?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #13:

"You use your smart account (a wallet contract you control) in L1 to deposit tokens in an L1 to L2 bridge.

You eagerly wait for the tx to be relayed. It gets relayed. Ok Thumbs up

But holy sheitz!! Your funds are lost. What happened?!"

* Question thread: [Solidity trivia #13 discussion](https://twitter.com/the_ethernaut/status/1445561945252196359?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #14:

"When you compile a Solidity contract, you get "bytecode" and "deployedBytecode". They are almost identical. What's the difference? Where is the difference? And why is there a difference?"

* Question thread: [Solidity trivia #14 discussion](https://twitter.com/the_ethernaut/status/1445819589217042440?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #15:

"Can you use creation bytecode to bundle a bunch of txs together in a single tx, instead of deploying a contract?"

* Question thread: [Solidity trivia #15 discussion](https://twitter.com/the_ethernaut/status/1446067631224676364?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #16:

"A contract's runtime byte code is:
0x363d3d37363df3

What does it do?"

* Question thread: [Solidity trivia #16 discussion](https://twitter.com/the_ethernaut/status/1446255553957744641?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #17:

"Can you guarantee that your complex smart contract system, which continuously evolves, will have the exact same contract addresses in all evm compatible networks it is deployed into, forever? If so, how?"

* Question thread: [Solidity trivia #17 discussion](https://twitter.com/the_ethernaut/status/1446957375366189058?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #18:

"A Universal proxy moves its upgradeability management code from the proxy to the implementation. This makes them simpler and more gas efficient. However an upgrade could contain damaged upgradability code and “brick” the proxy.

How could this be avoided?"

* Question thread: [Solidity trivia #18 discussion](https://twitter.com/the_ethernaut/status/1447183467641331713?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #19:

"Smart contract A’s view function a() needs to call a third party contract B’s b() function, which is also supposed to be view.
Can it guarantee that it will really be read only too by just calling it, or does it need to take any additional precautions?"

* Question thread: [Solidity trivia #19 discussion](https://twitter.com/the_ethernaut/status/1447341568269045760?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #20:

"Minimal proxies are a great way of producing cheap standalone instances of a complex system for each user. They’re usually created by a factory that directly tailors it at a bytecode level."
+
"If a factory contract manufactures instances at the bytecode level, and their bytecode does not adhere to any known standard, how could you verify these instances in Etherscan?"

* Question thread: [Solidity trivia #20 discussion](https://twitter.com/the_ethernaut/status/1448631610375610369?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #21:

"A random number oracle provides a number between 0 and 2^256. How would you manipulate this number in Solidity to represent a random number between zero and 500?"

* Question thread: [Solidity trivia #21 discussion](https://twitter.com/the_ethernaut/status/1449196958690603008?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #22:

"You launch an NFT collection. As an artist / dev, you know which tokenId’s will be rare. Every time someone mints, you pick one at random and upload it to IPFS. How do you guarantee transparency / fairness in this process?"

* Question thread: [Solidity trivia #22 discussion](https://twitter.com/the_ethernaut/status/1449473885150142466?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

### Solidity Trivia #23:

"Solidity has a non-frequently used keyword "anonymous" that can be used in events. When would you use it and what for?"

* Question thread: [Solidity trivia #23 discussion](https://twitter.com/the_ethernaut/status/1450100070959955968?s=20)
* Explanation thread: [TBD]()
* Demo contracts: `n/a`
* Demo tests: `n/a`

