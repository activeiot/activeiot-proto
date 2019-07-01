FROM activeiot/docker-proto@sha256:f4b0aae07955c642df51a316f2c37b3c50db994db439ab9685537c0146cfce3b AS builder

WORKDIR /wd

COPY . .

RUN make dep

RUN make

