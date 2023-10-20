#!/bin/bash

# Get the model URL from the environment variable
MODEL_URL=${MODEL_URL_ENV}

# Extract the model file subtitle from the URL
MODEL_SUBTITLE=$(basename "$MODEL_URL")

# Define the model file path using the extracted subtitle
MODEL_FILE="models/$MODEL_SUBTITLE"

# Create the models directory if it doesn't exist
mkdir -p models

# Download the model if it doesn't exist
if [ ! -f "$MODEL_FILE" ]; then
  wget -O "$MODEL_FILE" "$MODEL_URL"
fi

# Launch the server
exec ./bin/server -m "$MODEL_FILE" -c 8192 --host 0.0.0.0
