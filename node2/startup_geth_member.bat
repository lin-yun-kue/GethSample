geth --datadir data2 --nodiscover --syncmode "full" --networkid 12345 --port 30001 --ipcpath ./ipc2 --authrpc.port 8552 --http --http.port 8546 --http.api net,eth,web3 --http.corsdomain '*' --config config.toml console