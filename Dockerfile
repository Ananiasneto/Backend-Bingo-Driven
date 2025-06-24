FROM node

WORKDIR /usr/src

COPY . .

RUN command npm install

RUN npm run build

CMD ["npm", "start"]