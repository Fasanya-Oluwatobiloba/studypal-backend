FROM alpine:3.18

# Install dependencies
RUN apk add --no-cache curl

# Create app directory
RUN mkdir -p /app && chown -R 1000:1000 /app

# Copy PocketBase binary and data
COPY ./pocketbase /app/pocketbase
COPY ./pb_data /app/pb_data  # <-- Add this line

# Set permissions
RUN chmod +x /app/pocketbase && \
    chown -R 1000:1000 /app/pb_data  # <-- Critical for writes

# Environment variables
ENV PB_DATA_DIR="/app/pb_data" \
    PORT=8080

# Health check and startup
USER 1000
WORKDIR /app
EXPOSE 8080
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080"]