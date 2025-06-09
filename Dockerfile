FROM alpine:3.18

# Install dependencies
RUN apk add --no-cache curl

# Create app directory
RUN mkdir -p /app && chown -R 1000:1000 /app

# Copy files (use relative paths)
COPY pocketbase /app/pocketbase
COPY pb_data /app/pb_data

# Set permissions
RUN chmod +x /app/pocketbase && \
    chown -R 1000:1000 /app/pb_data

# Environment
ENV PB_DATA_DIR="/app/pb_data" PORT=8080

# Healthcheck and run
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/api/health || exit 1
USER 1000
WORKDIR /app
EXPOSE 8080
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080"]