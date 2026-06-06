FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt install -y curl git sudo xz-utils && rm -rf /var/lib/apt/lists/*

# Install Hermes Agent
RUN curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

# Install Telegram gateway dependency
RUN /usr/local/lib/hermes-agent/venv/bin/pip install python-telegram-bot==21.12 python-telegram-bot[job-queue]==21.12 2>&1 | tail -3

# Force WAL mode for SQLite on network drives
COPY fix-sqlite.sh /fix-sqlite.sh
RUN chmod +x /fix-sqlite.sh

# Entry point - fix SQLite modes first, then start gateway
ENTRYPOINT ["/fix-sqlite.sh"]
CMD ["hermes", "gateway", "run"]