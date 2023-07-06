FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    libopencv-dev \
    python3-pip \
    python3-opencv openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install tensorflow && \
    pip3 install numpy pandas scikit-learn scikit-image matplotlib seaborn jupyter pyyaml h5py Cython requests pyspark && \
    pip3 install keras --no-deps && \
    pip3 install opencv-python && \
    pip3 install imutils

ENV SHELL=/bin/bash
SHELL ["/bin/bash", "-c"]

RUN ["mkdir", "notebooks"]
RUN echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))" > /etc/profile.d/javahome.sh
RUN echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))" >> ~/.bashrc

COPY conf/.jupyter /root/.jupyter
COPY run_jupyter.sh /

# Jupyter and Tensorboard ports
EXPOSE 8888 6006

# Store notebooks in this mounted directory
VOLUME /notebooks

CMD ["/run_jupyter.sh"]
