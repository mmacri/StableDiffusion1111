# Stable Diffusion WebUI Docker Setup

This repository contains a Docker configuration to run [Automatic1111's Stable Diffusion WebUI](https://github.com/AUTOMATIC1111/stable-diffusion-webui) locally with GPU acceleration.

## Folder Structure
```
outputs/
models/
  Stable-diffusion/
  Lora/
  VAE/
  embeddings/
  ControlNet/
extensions/
configs/
scripts/
```

## Getting Started
1. Install Docker, Docker Compose, the NVIDIA driver, and `nvidia-docker2` on your host.
2. Run the setup script to create the folder structure. Add `--deforum` to also clone the Deforum extension:
   ```bash
   bash scripts/setup.sh [--deforum]
   ```
3. Place your model files in the appropriate `models/` subdirectories.
4. Launch the Web UI:
   ```bash
   docker compose up -d
   ```
5. Open <http://localhost:7860> in your browser.

## Notes
- The `CLI_ARGS` in `docker-compose.yml` enable advanced features: `--allow-code`, `--xformers`, `--enable-insecure-extension-access`, `--listen`, `--enable-console-prompts`, and `--api`. Note the security implications of flags like `--listen` and `--enable-insecure-extension-access`, especially if running on a machine exposed to an untrusted network.
- `configs/` and `scripts/` are mounted into the container so you can tweak UI configs and custom scripts without rebuilding.
- Output images (and videos from extensions) are saved under `outputs/`.
