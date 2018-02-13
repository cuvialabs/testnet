# Ethereum Testnet Node
All the files you need to setup a node on our Ethereum Testnet.
Based on: https://github.com/Capgemini-AIE/ethereum-docker

### Prerequisites:
Make sure your the host machine has docker & docker-compose installed. 
   * You can install Docker here: https://docs.docker.com/install/. 
   * If you are running an OS without HyperV support (Windows 10 Home), download the Docker Toolbox here: https://docs.docker.com/toolbox/.
### How to start a node:
``` bash
# Clone the project:
git clone https://github.com/cuvialabs/testnet.git

# Navigate to the docker-compose file:
cd ./testnet/ethereum-docker/external

# Start the node:
docker-compose up -d
```
Visit netstats at ${BOOTSTRAP_IP}:3000 (http://23.24.168.98:3000/) for verification (your nodes should be listed prefixed by "GUEST_").
### How to stop a node:
``` bash
# Navigate to the docker-compose file (same as above):
cd ./testnet/ethereum-docker/external

# Stop the node:
docker-compose stop
```
### How to execute commands on individual nodes in the geth console:
``` bash
# Run the command bleow. Replace "1" with the node number that you want to look at.
docker exec -it external_geth_1 geth attach ipc://root/.ethereum/devchain/geth.ipc
```
### Caveats:
1. The bootstrap IP and node name is currently hardcoded in ./ethereum-docker/external/start.sh (lines 4 & 5)
2. Currently all external nodes start idle on launch. To start mining, follow the instructions in "How to execute commands on individual nodes in the geth console" to open a console and run "miner.start()".
3. Miners need to create the DAG before mining starts. This could take a while. If you want a pre-generated DAG, let me know.
4. The coinbase account is defaulted to account #0 (0x007ccffb7916f37f7aeef05e8096ecfbe55afc2f) for all nodes. That means all nodes will be mining for the same account at the start. This can be changed in the console.
