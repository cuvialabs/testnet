# testnet
All the files you need to setup a node on our Ethereuem Testnet
Based on: https://github.com/Capgemini-AIE/ethereum-docker

How to Start an External Node:
    1. Make sure your the host machine has docker & docker-compose installed. 
        - You can install Docker here: https://docs.docker.com/install/. 
        - If you are running an OS without HyperV support (Windows 10 Home), download the Docker Toolbox here: https://docs.docker.com/toolbox/.
    2. Navigate to the docker-compose file: cd ./ethereum-docker/external/docker-compose.yml
    3. Open a command prompt in the same folder as the docker-compose file and run: docker-compose up -d
    4. Visit netstats at ${BOOTSTRAP_IP}:3000 (http://23.24.168.98:3000/) for verification (your nodes should be listed prefixed by "GUEST_").

How to Stop an External Node:
    1. Navigate to the docker-compose file (same as above).
    2. Open a command prompt and run: docker-compose stop

How to execute commands on individual nodes in the geth console (optional):
    1. docker exec -it external_geth_1 geth attach ipc://root/.ethereum/devchain/geth.ipc
        notes: replace "1" with the node number that you want to look at.

Caveats:
    1. The bootstrap IP and node name is currently hardcoded in ./ethereum-docker/external/start.sh (lines 4 & 5)
    2. Currently all external nodes start idle on launch. To start mining, follow the instructions in "How to execute commands on individual nodes in the geth console" to open a console and run "miner.start()".
    3. Miners need to create the DAG before mining starts. This could take a while. If you want a pre-generated DAG, let me know.
    4. The coinbase account is defaulted to account #0 (0x007ccffb7916f37f7aeef05e8096ecfbe55afc2f) for all nodes. That means all nodes will be mining for the same account at the start. This can be changed in the console.
