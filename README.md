# IPTV Multi-Source Server

Usage:

`docker run -p 5301:5301 -p 5302:5302 -p 5303:5303 -v vox:/vox ghcr.io/sky7t/tv_source:latest`

## 🚀 Features
- Runs **all services in parallel** inside one container:
  - JTV Go → `:5301`
  - Z5 → `:5302`
  - TPlay → `:5303`
- Minimal Alpine-based PHP 8.2 image for efficiency.

