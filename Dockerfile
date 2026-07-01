FROM node:22-alpine

WORKDIR /usr/src/app

COPY package*.json ./
COPY index.js .

ENV NODE_OPTIONS="--max-old-space-size=1536"

RUN npm ci --omit=dev --foreground-scripts --verbose

EXPOSE 3000
CMD ["node", "index.js"] 