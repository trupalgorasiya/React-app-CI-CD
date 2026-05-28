FROM node:24

WORKDIR /myapp

COPY package*.json ./

RUN npm install 

COPY . .

EXPOSE 3000

CMD ["npm", "start"]


#create img from a file
#docker build -t react-cicd-app .

#starting continer 
#docker run -p 3000:3000 react-cicd-app