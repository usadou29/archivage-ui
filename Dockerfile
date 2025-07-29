# Étape 1 : build Angular
FROM node:20-alpine AS build
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

# Étape 2 : image Nginx
FROM nginx:alpine
COPY --from=build /app/dist/archivage-ui/browser /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]