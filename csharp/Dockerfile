# Start with the latest Alpine image
FROM alpine:latest

# Install Mono and its dependencies
RUN apk add --no-cache mono bash

# Create a limited user
RUN adduser -D -g '' limiteduser

# Create application directory and set permissions
RUN mkdir /app && chown limiteduser:limiteduser /app

# Set the working directory
WORKDIR /app

# Copy your scripts into the container
COPY save_code.sh .
COPY csharp_executor.sh .

# Make the scripts executable
RUN chmod +x save_code.sh csharp_executor.sh

# Switch to the limited user
USER limiteduser

# Command to run the scripts
CMD ["sh", "-c", "./save_code.sh && ./csharp_executor.sh"]

