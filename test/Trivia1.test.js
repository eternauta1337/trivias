const assert = require('assert/strict');
const { ethers } = require('hardhat');

describe('Trivia1', function () {
  let ContractA, ContractB;

  let user;

  let errors, records;

  before('identify signers', async () => {
    ([user] = await ethers.getSigners());
  });

  before('deploy the contracts', async () => {
    let factory;

    factory = await ethers.getContractFactory('ContractA_t1');
    ContractA = await factory.deploy();

    factory = await ethers.getContractFactory('ContractB_t1');
    ContractB = await factory.deploy();
  });

  async function multipleCallsWithMethod(method, times) {
    async function call() {
      let receipt;

      try {
        const tx = await ContractA[method](ContractB.address);
        receipt = await tx.wait();
      } catch (error) {
        errors.push(error.toString());
      }

      if (receipt && receipt.events.length > 0) {
        const event = receipt.events[0];
        records.push(event.args[0]);
      }
    }

    errors = [];
    records = [];

    for (let i = 0; i < times; i++) {
      await call();
    }
  }

  describe('when using the first method', () => {
    before('call method1 twice', async () => {
      await multipleCallsWithMethod('method1', 2)
    });

    it('will have reverted once with the expected error', async () => {
      assert.equal(errors.length, 1);
      assert.equal(errors[0].toString(), 'Error: VM Exception while processing transaction: reverted with reason string \'Nope!\'');
    });

    it('will have recorded contract A as the sender', async () => {
      assert.equal(records.length, 1);
      assert.equal(records[0], ContractA.address);
    });
  });

  describe('when using the second method', () => {
    before('call method2 twice', async () => {
      await multipleCallsWithMethod('method2', 2)
    });

    it('will not have reverted', async () => {
      assert.equal(errors.length, 0);
    });

    it('will have recorded contract A as the sender', async () => {
      assert.equal(records.length, 1);
      assert.equal(records[0], ContractA.address);
    });
  });

  describe('when using the third method', () => {
    before('call method3 twice', async () => {
      await multipleCallsWithMethod('method3', 2)
    });

    it('will not have reverted', async () => {
      assert.equal(errors.length, 0);
    });

    it('will have recorded the user as the sender', async () => {
      assert.equal(records.length, 1);
      assert.equal(records[0], user.address);
    });
  });
});
