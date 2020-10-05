FROM node:12.10.0-alpine
ARG ENV_FILE=./.env

LABEL maintainer="Liyas Thomas (liyascthomas@gmail.com)"

# Add git as the prebuild target requires it to parse version information
RUN apk add --update --no-cache \
  git

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY $ENV_FILE ./.env
COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
