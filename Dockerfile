FROM node:23-slim
LABEL DESCRIPTION="Dockerfile for our sample book app backend service"

WORKDIR /app
COPY package.json package.json
COPY index.js index.js
COPY index.test.js index.test.js

RUN npm install

EXPOSE 1050

CMD [ "index.js" ]
ENTRYPOINT [ "node" ]


