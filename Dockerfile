# FROM node:alpine as builder
# WORKDIR '/app'
# COPY 'package.json' .
# RUN npm install
# COPY . .
# RUN npm run build

# # from starts a new phase
# FROM nginx
# # this is instead of the -p 3000:3000, elasticbeanstalk (aws) will use this to expose a port
# EXPOSE 80
# COPY --from=builder /app/build usr/share/nginx/html
# # no need for a run command as the nginx image does it on its own



FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html