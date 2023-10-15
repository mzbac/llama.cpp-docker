#!/bin/bash

# Define the model URL and file path
MODEL_URL="https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.1-GGUF/resolve/main/mistral-7b-instruct-v0.1.Q5_K_M.gguf"
MODEL_FILE="models/mistral-7b-instruct-v0.1.Q5_K_M.gguf"

# Create the models directory if it doesn't exist
mkdir -p models

# Download the model if it doesn't exist
if [ ! -f "$MODEL_FILE" ]; then
  wget -O "$MODEL_FILE" "$MODEL_URL"
fi

# Launch the server
exec ./bin/server -m "$MODEL_FILE" -c 8192 --host 0.0.0.0
