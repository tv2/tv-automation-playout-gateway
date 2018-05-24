# BUILD IMAGE
FROM node:8.11.1 AS build
WORKDIR /opt/playout-gateway
COPY . .
RUN rm yarn.lock
RUN yarn install --check-files
RUN yarn build

# DEPLOY IMAGE
FROM node:8.11.1-alpine
COPY --from=build /opt/playout-gateway /opt/playout-gateway
WORKDIR /opt/playout-gateway
CMD ["yarn", "start"]
