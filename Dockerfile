# Use Debian Bookworm Slim as the base image
FROM debian:bookworm-slim

WORKDIR /server

RUN apt update && apt install -y curl jq

# Make the startup script executable
RUN curl -s https://api.github.com/repos/compujuckel/AssettoServer/releases/latest \
            | jq -r '.assets[] | select(.name == "assetto-server-linux-x64.tar.gz") | .browser_download_url' \
            | xargs curl -Ls -o assetto-server-linux-x64.tar.gz 

RUN curl -L -o SRP MAIN_0.9.1_OFFICIAL.7z 'https://drive.google.com/uc?export=download&id=1HHYG9H9xaEfhCIvl7n5klOJZhUSYfDk0'

RUN curl -b ./cookie.txt -L 'https://drive.google.com/uc?export=download&confirm=[TOKEN]&id=1HHYG9H9xaEfhCIvl7n5klOJZhUSYfDk0' -o your_file.7z


RUN tar -xvf assetto-server-linux-x64.tar.gz

# Command to run the startup script
CMD ["ls"]
