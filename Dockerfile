# Dockerfile
FROM node:25

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Copiar archivos al contenedor
COPY package*.json ./
COPY index.js .

# Limita el consumo interno de RAM de Node a 1.5 GB
ENV NODE_OPTIONS="--max-old-space-size=1536"

# Si esta imagen es para producción, ignora las dependencias de desarrollo para ahorrar memoria
RUN npm ci --omit=dev

# Exponer el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "index.js"]