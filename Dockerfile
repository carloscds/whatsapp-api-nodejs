FROM node:17.2.0-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN apk add git
RUN yarn install
COPY . .
EXPOSE 3333
RUN chown -R node /usr/src/app
USER node
CMD ["yarn", "start"]
