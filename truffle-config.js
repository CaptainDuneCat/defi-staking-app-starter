//  require('@babel/preset-env');
// require('babel-polyfill');

module.exports = {
    networks:{
        development:{
            host: '127.0.0.1',
            port: '7545',
            network_id: '*' // connect to any network.
        },
    },
    contracts_directory: './defi-staking-app-starter/src/contracts/',
    contracts_build_directory: './defi-staking-app-starter/src/truffle_abis',
    compilers: {
        solc: {
            version: '^0.8.0',
            optimizer: {
                enabled: true,
                runs: 200 
            },
}
    }
}