FROM python:3.10.2-slim

ENV PYTHONUNBUFFERED 1
WORKDIR /DiscordBot
COPY requirements.txt .

# Install necessary build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    rustc \
    cargo

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m discordbot && chown -R discordbot:discordbot /DiscordBot
USER discordbot

CMD ["python3", "main.py"]