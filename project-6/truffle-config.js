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
    }
  }
};