FROM n8nio/n8n

USER root

# Install custom nodes
RUN apt-get update && apt-get install -y build-essential python3

USER node

COPY package.json /home/node/

WORKDIR /home/node

RUN npm install --omit=dev && npx n8n install-nodes

WORKDIR /home/node/.n8n

CMD ["n8n"]
