FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <== has the build of the stuff we want

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# when starting the nginx, it starts nginx
