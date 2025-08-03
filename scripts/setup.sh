#!/usr/bin/env bash
set -e

# Create directory structure
mkdir -p \
  outputs \
  models/Stable-diffusion \
  models/Lora \
  models/VAE \
  models/embeddings \
  models/ControlNet \
  extensions \
  configs \
  scripts

# Optionally clone Deforum extension for video generation
if [[ "$#" -gt 1 ]]; then
    echo "Error: Too many arguments." >&2
    echo "Usage: $0 [--deforum]" >&2
    exit 1
fi

# Optionally clone Deforum extension for video generation
if [[ "$1" == "--deforum" ]]; then
  if [ -d extensions/deforum ]; then
    echo "Deforum already present, skipping clone"
  else
    git clone https://github.com/deforum-art/deforum-for-automatic1111-webui extensions/deforum
  fi
elif [[ "$#" -eq 1 ]]; then
    echo "Error: Unknown argument '$1'." >&2
    echo "Usage: $0 [--deforum]" >&2
    exit 1
fi

echo "Setup complete. Place your models in the respective models/ subdirectories."

