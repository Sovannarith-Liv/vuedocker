FROM node as build 

WORKDIR /app 

COPY package*.json . 

RUN npm install 

COPY . . 

RUN npm run build


FROM nginx

COPY --from=build /app/dist /app 
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080