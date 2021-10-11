FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# a new FROM statement automatically drops old image
FROM nginx
COPY --from=builder /app/build usr/share/nginx/html
# default command is start nginx