FROM node:22-alpine

WORKDIR /usr/src/app

COPY package*.json ./
COPY index.js .

ENV NODE_OPTIONS="--max-old-space-size=1536"

# Forzar registro público de npm, ignorando cualquier .npmrc corporativo/Nexus
RUN npm config set registry https://registry.npmjs.org/

RUN npm ci --omit=dev --foreground-scripts

EXPOSE 3000
CMD ["node", "index.js"]