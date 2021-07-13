FROM node:14.7-alpine3.12 as buildImage
WORKDIR '/app'
COPY package*.json ./
RUN yarn
COPY . .
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=buildImage /app/build /usr/share/nginx/html