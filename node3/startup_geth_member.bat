geth --datadir data3 --nodiscover --syncmode "full" --networkid 12345 --port 30002 --ipcpath ./ipc3 --authrpc.port 8553 --http --http.port 8547 --http.api net,eth,web3 --http.corsdomain '*' --config config.toml console