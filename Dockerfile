FROM debian:jessie-slim

MAINTAINER Rhuan Barreto <rhuan@rhuan.com.br>

RUN apt-get update && apt-get install -y gfortran make

RUN mkdir /at
COPY ./at /at

WORKDIR /at

RUN make clean && make all & make install
