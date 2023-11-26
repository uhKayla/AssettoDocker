# Use Debian Bookworm Slim as the base image
FROM debian:bookworm-slim

COPY server /server

WORKDIR /server

RUN apt update && apt install -y curl jq p7zip

# Make the startup script executable
RUN curl -s https://api.github.com/repos/compujuckel/AssettoServer/releases/latest \
            | jq -r '.assets[] | select(.name == "assetto-server-linux-x64.tar.gz") | .browser_download_url' \
            | xargs curl -Ls -o assetto-server-linux-x64.tar.gz 

RUN tar -xvf assetto-server-linux-x64.tar.gz

RUN ls

# Command to run the startup script
CMD ["./AssettoServer"]
