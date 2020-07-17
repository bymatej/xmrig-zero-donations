FROM ubuntu:20.04

LABEL maintainer="programming@bymatej.com"
# Source: https://github.com/xmrig/xmrig

ARG DEBIAN_FRONTEND=noninteractive
ENV THREADS=2
ENV CPU_PRIORITY=4

# Update, install dependencies and clone from Git
RUN apt-get update
RUN apt-get install -y git \
	build-essential \
	cmake \
	libuv1-dev \
	libmicrohttpd-dev \
	libssl-dev \
	libhwloc-dev
RUN git clone https://github.com/xmrig/xmrig.git

# Build the project
WORKDIR /xmrig/
# Modify donations
RUN echo "Donaitons will be modified! Please, donate to the original developer as instructed here: https://github.com/xmrig/xmrig/blob/master/src/donate.h#L43"
RUN sed -i 's/kDefaultDonateLevel = 1/kDefaultDonateLevel = 0/g' src/donate.h && \
    sed -i 's/kMinimumDonateLevel = 1/kMinimumDonateLevel = 0/g' src/donate.h
# Build
RUN mkdir build && cd build
WORKDIR /xmrig/build/
RUN cmake ..
RUN make
RUN mkdir /miner/ && mv xmrig /miner/
WORKDIR /miner

# Cleanup
RUN apt-get remove -y git \
	build-essential \
	cmake
RUN apt-get -y autoremove && apt-get -y autoclean


# Run xmrig
RUN bash -c "echo vm.nr_hugepages=1280 >> /etc/sysctl.conf"
CMD ["./xmrig", "-c", "/miner/config.json", "-t", "$THREADS", "--cpu-priority", "$CPU_PRIORITY"]
