# Etapa 1: build de Angular
FROM node:20.19 AS builder

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod && ls -l /app/dist

# Etapa 2: Nginx para servir la app
FROM nginx:alpine

# Copiar la build generada al servidor web
COPY --from=builder /app/dist/front/browser/ /usr/share/nginx/html

# Configuración personalizada de Nginx (opcional)

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
