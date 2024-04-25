FROM node:18.12-alpine AS build 

WORKDIR /app 
COPY . . 

FROM nginx:stable-alpine
COPY --from=build /app/index.html /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]