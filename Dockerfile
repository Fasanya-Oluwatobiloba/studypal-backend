FROM alpine:3.18

# Install dependencies (curl for health check)
RUN apk add --no-cache curl

# Create app directory with correct permissions
RUN mkdir -p /app/pb_data && \
    chown -R 1000:1000 /app

# Copy PocketBase binary (must be Linux version!)
COPY ./pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Set environment variables
ENV PB_DATA_DIR="/app/pb_data" \
    PORT=8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/api/health || exit 1

# Run as non-root user
USER 1000
WORKDIR /app

# Expose and run
EXPOSE 8080
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080"]