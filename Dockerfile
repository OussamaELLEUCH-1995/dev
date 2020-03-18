FROM node:alpine as builder
WORkDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx 
COPY --form=builder ./build /var/www
EXPOSE 80
ENTRYPOINT ["nginx","-g","daemon off;"]