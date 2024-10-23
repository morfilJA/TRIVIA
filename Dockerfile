# Use a minimal web server
FROM nginx:alpine

# Copia los archivos compilados de Flutter Web al directorio de NGINX
COPY build/web /usr/share/nginx/html

# Exponer el puerto 80
EXPOSE 80
