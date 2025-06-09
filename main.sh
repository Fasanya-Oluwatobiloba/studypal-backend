#!/bin/bash
set -e

# Ensure permissions
chmod +x ./pocketbase

# Start PocketBase
exec ./pocketbase serve --http=0.0.0.0:${PORT:-8080} --dir=pb_data