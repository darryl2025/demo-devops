# Image nginx légère
FROM nginx:alpine

# Copier le site web
COPY index.html /usr/share/nginx/html/

# Exposer le port 80
EXPOSE 80

# Démarrer nginx
CMD ["nginx", "-g", "daemon off;"]
```

### Étape 3.3 : Créer .dockerignore

Créez le fichier **`.dockerignore`** :
```
.git
.github
README.md
*.md
.gitignore