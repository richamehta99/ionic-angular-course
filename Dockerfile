
### STAGE 1: Build ###
FROM node:latest AS build
WORKDIR www/app
COPY package.json ./
RUN npm install -g ionic
COPY ./ www/app/
RUN npm run build 

### STAGE 2: Run ###
FROM nginx:latest
COPY --from=build /app/www/ /usr/share/nginx/html/

# COPY --from=build /app/dist/ /usr/share/nginx/html
# COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
