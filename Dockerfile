FROM ubuntu:24.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_US:en TZ=Asia/Kolkata

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    python3-pip \
    git \
    libtinyxml2-dev \
    libcurl4-gnutls-dev \
    libssl-dev \
    liblzma-dev \
    libzen-dev \
    libmediainfo-dev \
    mediainfo \
    wget \
    ffmpeg \
    sox \
    libsox-fmt-mp3 \
    locales \
    megatools \
  && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x start

CMD ["bash", "start"]
