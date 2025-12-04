# Image nginx légère
FROM nginx:alpine

# Copier le fichier HTML dans le répertoire nginx
COPY index.html /usr/share/nginx/html/

# Exposer le port 80
EXPOSE 80

# Démarrer nginx
CMD ["nginx", "-g", "daemon off;"]