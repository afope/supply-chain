const HDWalletProvider = require('truffle-hdwallet-provider');
require('dotenv').config(); // Store environment-specific variable from '.env' to process.env

const infuraKey = process.env.INFURAKEY;
const mnemonic = process.env.MNEMONIC;

module.exports = {
  compilers: {
    solc: {
      version: "0.4.24"
    }
  },
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },

    // Useful for deploying to a public network.
    // NB: It's important to wrap the provider as a function.
    rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, `https://rinkeby.infura.io/v3/${infuraKey}`),
      network_id: 4,       // rinkeby's id
      gas: 4500000,        // rinkeby has a lower block limit than mainnet
      gasPrice: 10000000000
    },
  }
};
