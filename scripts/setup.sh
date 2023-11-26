#!/bin/bash
printf "Downloading with curl"

if [ "$ARCHITECTURE" == "arm" ]; then
    echo "Running on ARM"
    curl -s https://api.github.com/repos/compujuckel/AssettoServer/releases/latest \
        | jq -r '.assets[] | select(.name == "assetto-server-linux-x64.tar.gz") | .browser_download_url' \
        | xargs curl -Ls -o assetto-server-linux-arm64.tar.gz        
else
    echo "Running on amd64"
    curl -s https://api.github.com/repos/compujuckel/AssettoServer/releases/latest \
        | jq -r '.assets[] | select(.name == "assetto-server-linux-x64.tar.gz") | .browser_download_url' \
        | xargs curl -Ls -o assetto-server-linux-x64.tar.gz    
fi

# Rest of your startup script
