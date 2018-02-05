FROM ethereum/client-go:stable

RUN apk add --update git bash nodejs nodejs-npm perl

RUN cd /root &&\
    git clone https://github.com/cubedro/eth-net-intelligence-api &&\
    cd eth-net-intelligence-api &&\
    npm install &&\
    npm install -g pm2

ADD start.sh /root/start.sh
ADD app.json /root/eth-net-intelligence-api/app.json
ADD static-nodes.json /root/.ethereum/devchain/static-nodes.json
RUN chmod +x /root/start.sh


