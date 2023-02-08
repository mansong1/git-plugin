FROM alpine/git

# Copies the clone script to the Docker image
COPY clone.sh /usr/local/bin/

# Makes the clone script executable
RUN chmod +x /usr/local/bin/clone.sh

ENTRYPOINT [ "/usr/local/bin/clone.sh" ]
