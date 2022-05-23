const Tether = artifacts.require('Tether');
const RWD = artifacts.require('RWD');
const DecentralBank = artifacts.require('DecentralBank');
const Joy = artifacts.require('JoyToken');

module.exports = async function(deployer, network, accounts) {
    await deployer.deploy(Tether)
    const tether = await Tether.deployed()

    await deployer.deploy(RWD)
    const rwd = await RWD.deployed()
    // Deploy K
    await deployer.deploy(DecentralBank, rwd.address, tether.address)
    const decentralBank = await DecentralBank.deployed()
    // Transfer all RWD to Decentral Bank
    await rwd.transfer(decentralBank.address, '1000000000000000000000000')

    // Distribute 100 Tether tokens to investor
    await tether.transfer(accounts[1], '1000000000000000000000')

    await deployer.deploy(Joy, 'Joy Super Token', 'Joy');

};

