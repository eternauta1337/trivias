const assert = require('assert/strict');
const { ethers } = require('hardhat');

describe('Trivia2', function () {
  let Proxy, Instance, ImplementationV1, ImplementationV2;

  function itBehavesLikeImplementationV1() {
    before('set value', async () => {
      const tx = await Instance.setValue('42');
      await tx.wait();
    });

    it('sets the value', async () => {
      assert.equal((await Instance.value()).toString(), '42');
    });
  }

  function itBehavesLikeImplementationV2() {
    before('set addr', async () => {
      const tx = await Instance.setAddr('0x0000000000000000000000000000000000000042');
      await tx.wait();
    });

    it('sets the addr', async () => {
      assert.equal((await Instance.addr()).toString(), '0x0000000000000000000000000000000000000042');
    });
  }

  describe('when using transparent proxies', () => {
    before('deploy the proxy with the first implementation', async () => {
      let factory;

      factory = await ethers.getContractFactory('ImplementationV1_t2');
      ImplementationV1 = await factory.deploy();

      factory = await ethers.getContractFactory('TransparentProxy_t2');
      Proxy = await factory.deploy(ImplementationV1.address);

      Instance = await ethers.getContractAt('ImplementationV1_t2', Proxy.address);
    });

    it('shows that the implementation is set', async () => {
      assert.equal(await Proxy.getImplementation(), ImplementationV1.address);
    });

    itBehavesLikeImplementationV1();

    describe('when upgrading to V2', () => {
      before('upgrade', async () => {
        const factory = await ethers.getContractFactory('ImplementationV2_t2');
        ImplementationV2 = await factory.deploy();

        const tx = await Proxy.upgradeTo(ImplementationV2.address);
        await tx.wait();

        Instance = await ethers.getContractAt('ImplementationV2_t2', Proxy.address);
      });

      it('shows that the implementation is set', async () => {
        assert.equal(await Proxy.getImplementation(), ImplementationV2.address);
      });

      itBehavesLikeImplementationV1();
      itBehavesLikeImplementationV2();
    });
  });

  describe('when using universal proxies', () => {
    before('deploy the proxy with the first implementation', async () => {
      let factory;

      factory = await ethers.getContractFactory('UniversalImplementationV1_t2');
      ImplementationV1 = await factory.deploy();

      factory = await ethers.getContractFactory('UniversalProxy_t2');
      Proxy = await factory.deploy(ImplementationV1.address);

      Instance = await ethers.getContractAt('UniversalImplementationV1_t2', Proxy.address);
    });

    it('shows that the implementation is set', async () => {
      assert.equal(await Instance.getImplementation(), ImplementationV1.address);
    });

    itBehavesLikeImplementationV1();

    describe('when upgrading to V2', () => {
      before('upgrade', async () => {
        const factory = await ethers.getContractFactory('UniversalImplementationV2_t2');
        ImplementationV2 = await factory.deploy();

        const tx = await Instance.upgradeTo(ImplementationV2.address);
        await tx.wait();

        Instance = await ethers.getContractAt('UniversalImplementationV2_t2', Proxy.address);
      });

      it('shows that the implementation is set', async () => {
        assert.equal(await Instance.getImplementation(), ImplementationV2.address);
      });

      itBehavesLikeImplementationV1();
      itBehavesLikeImplementationV2();
    });
  });
});
