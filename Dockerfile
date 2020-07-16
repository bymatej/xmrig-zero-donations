FROM ubuntu:20.04

LABEL maintainer="programming@bymatej.com"
# Source: https://github.com/xmrig/xmrig

ARG DEBIAN_FRONTEND=noninteractive
ENV XMRIG_JSON_CONFIG_PATH=

# Update, install dependencies and clone from Git
RUN apt-get update
RUN apt-get install -y git \
	libxcb1 \
	libx11-xcb1 \
	libxcb-keysyms1 \
	libxcb-image0 \
	libxcb-shm0 \
	libxcb-icccm4 \
	libxcb-sync1 \
	libxcb-render-util0 \
	gcc-7 \
	g++-7 \
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

# Cleanup
RUN apt-get remove -y git \
				      build-essential \
				      cmake \
				      libuv1-dev \
				      libssl-dev \
				      libhwloc-dev
RUN apt-get -y autoremove && apt-get -y autoclean


# Run xmrig
WORKDIR /xmrig/
CMD ["./xmrig", "-c", "$XMRIG_JSON_CONFIG_PATH"]
