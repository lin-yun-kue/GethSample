*建立創世區塊
geth --datadir data init genesis.json
geth --datadir data2 init genesis.json


------------------------------------------------------
*啟動geth
geth --datadir data --nodiscover --syncmode "full" --networkid 12345 --port 30000 --ipcpath ./ipc1 --authrpc.port 8551 --http --http.port 8545 --http.api net,eth,web3 --http.corsdomain '*' --allow-insecure-unlock --unlock "67f9bf5cdae28C05761e1e8bFD51bAf107981F6e" --password ./data/password.txt console

geth --datadir data2 --nodiscover --syncmode "full" --networkid 12345 --port 30001 --ipcpath ./ipc2 --authrpc.port 8552 --http --http.port 8546 --http.api net,eth,web3 --http.corsdomain '*' console

--datadir: 存放資料的位置
--nodiscover: 不自動探索節點
--syncmode: 同步模式
--networkid: 節點網路ID(要跟genesis一樣)
--ipcpath: 如果要在同一台機器上架設要指定不同的路徑才不會打架
--authrpc.port: 如果在同一台機器也要分別設定不同
--http.port: 如果在同一台機器也要分別設定不同
--http.corsdomain '*': 避免web cors問題
--allow-insecure-unlock 
--unlock "67f9bf5cdae28C05761e1e8bFD51bAf107981F6e" : 指定unlock的地址，如果不在這邊給就要進去用
--password ./data/password.txt console : 指定unlock的密碼


------------------------------------------------------
*加入member節點

1.方法一
admin.nodeInfo.enode => 取得節點資料
xox

admin.addPeer(xox) => 加入Peer

net.peerCount
net.listening => 要檢查是true

2.方法二
建立一個config.toml
[Node.P2P]
StaticNodes = ["enode address"]

-------------------------------------------------------
*啟動產區塊
檢查eth.coinbase有沒有值
沒有的話執行以下指令
miner.setEtherbase("填入signer address") => 地址格式 "0x"開頭

miner.start(x) => 這個指令是啟動產區塊，X是指定要啟動幾條thread，可以不指定會根據你的CPU有幾核心來就啟動多少thread

