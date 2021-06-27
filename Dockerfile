FROM debian:10-slim

WORKDIR /opt/arduino

COPY ./arduino-cli.yaml /opt/arduino/arduino-cli.yaml

RUN apt update && apt install -y curl python python-pip && \
    pip install Pyserial && \
    curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh && \
    ln -s /opt/arduino/bin/arduino-cli /usr/local/bin/ && \
    arduino-cli core update-index --config-file /opt/arduino/arduino-cli.yaml && \
    arduino-cli core install arduino:avr esp32:esp32 attiny:avr

ENTRYPOINT [ "arduino-cli" ]
