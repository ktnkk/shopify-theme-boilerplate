FROM ruby:3.0.2-bullseye

RUN apt update -q \
    && apt upgrade -y \
    && apt install wget sudo -y \
    && gem install shopify-cli -v 2.6.3 \
    && mkdir -p ~/.config/shopify \
    && printf "[analytics]\nenabled = false\n" > ~/.config/shopify/config \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - \
    && sudo apt install -y nodejs \
       vim

WORKDIR /usr/src/app
