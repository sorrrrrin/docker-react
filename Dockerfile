# "builder" phase
# Use an existing docker image as a base
FROM node:alpine as builder
WORKDIR /app
# Download an install a dependency	
COPY ./package.json ./
RUN npm install
COPY . .
# Tell the image what to do when it starts as a container
RUN npm run build


# "run" phase
# Use an existing docker image as a base
FROM nginx
# Download an install a dependency	
COPY --from=builder /app/build /usr/share/nginx/html