FROM node:20-bookworm-slim

# Install Chromium/Electron runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgbm1 \
    libdrm2 \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgtk-3-0 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    xdg-utils \
    libxshmfence1 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libxext6 \
    libxfixes3 \
    libpango-1.0-0 \
    libcairo2 \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

# Copy PaperQuire CLI from release tarball
# The linux-unpacked build is placed at /opt/paperquire
COPY paperquire-linux/ /opt/paperquire/
RUN chmod +x /opt/paperquire/paperquire && \
    ln -s /opt/paperquire/resources/bin/paperquire /usr/local/bin/paperquire

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
