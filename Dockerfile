# Use Debian Bookworm Slim as the base image
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y curl nano jq

WORKDIR /server

COPY scripts/setup.sh .

# Make the startup script executable
RUN chmod +x ./setup.sh

# Command to run the startup script
CMD ["./setup.sh"]
