FROM ubuntu:16.04

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update

RUN apt-get install -y wget git && rm -rf /var/lib/apt/lists/*

# software-properties-common RUN apt-add-repository universe

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda --version

RUN apt-get update && apt-get install --yes apt-transport-https libzmq5 libhdf5-cpp-11 libcurl4-openssl-dev libssl-dev libhdf5-10 libboost-regex1.58.0 libboost-log1.58.0 libboost-atomic1.58.0 libboost-chrono1.58.0 libboost-date-time1.58.0 libboost-filesystem1.58.0 libboost-program-options1.58.0 libboost-iostreams1.58.0

WORKDIR /deepsimulator
RUN git clone https://github.com/lykaust15/DeepSimulator.git && cd ./DeepSimulator/ && ./install.sh

ENTRYPOINT ["/DeepSimulator/deep_simulator.sh"]
