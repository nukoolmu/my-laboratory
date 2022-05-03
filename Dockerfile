FROM node

ENV https_proxy=http://10.137.18.82:443
ENV http_proxy=http://10.137.18.82:443


WORKDIR /app

COPY ./src/app.js .

RUN npm install express

CMD node app.js
