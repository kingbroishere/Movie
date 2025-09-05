FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install system dependencies needed for Pillow, tgcrypto, and other build tools
RUN apt-get update && apt-get install -y \
    gcc \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev \
    libfreetype6-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy the code into the container
COPY . /app/

# Install Python dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Expose the port your app runs on
EXPOSE 8080

# Run the bot
CMD ["python", "bot.py"]
