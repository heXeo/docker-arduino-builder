FROM java:8

ENV ARDUINO_IDE_VERSION 1.6.9

RUN apt-get update && apt-get install -y wget xz-utils
RUN wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz | tar xJ -C /opt
RUN ln -s /opt/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/
RUN ln -s /opt/arduino-${ARDUINO_IDE_VERSION}/arduino-builder /usr/local/bin/
RUN ln -s /opt/arduino-${ARDUINO_IDE_VERSION} /opt/arduino

ENTRYPOINT [ "arduino-builder" ]
