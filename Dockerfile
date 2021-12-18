FROM node:14.16.1-slim

ENV USER=decmusicbot

# Cài đặt python và tạo
RUN apt-get update && \
	apt-get install -y python3 build-essential && \
	apt-get purge -y --auto-remove
	
# Tạo người dùng evobot
RUN groupadd -r ${USER} && \
	useradd --create-home --home /home/evobot -r -g ${USER} ${USER}
	
# Thiết lập âm lượng và người dùng
USER ${USER}
WORKDIR /home/decmusicbot

COPY package*.json ./
RUN npm install
VOLUME [ "/home/decmusicbot" ]

COPY . .

ENTRYPOINT [ "node", "index.js" ]
