# syntax=docker/dockerfile:1
FROM ubuntu:20.10

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y g++ wget unzip
RUN apt-get install -y libopencv-dev
RUN	apt-get install -y python3-pip
RUN	apt-get install -y python3-opencv
RUN	apt-get install -y python3-numpy
RUN	apt-get install -y python3-scipy
#CERES
RUN	apt-get install -y libgoogle-glog-dev
RUN	apt-get install -y libgflags-dev
RUN	apt-get install -y libatlas-base-dev
RUN	apt-get install -y libeigen3-dev
RUN	apt-get install -y libsuitesparse-dev
#CERES
RUN	apt-get install -y build-essential
RUN	apt-get install -y cmake
RUN	apt-get install -y git 
RUN	apt-get install -y curl
RUN	apt-get install -y vim
RUN	apt-get install -y doxygen
RUN	apt-get install -y libomp-dev
#RUN apt-get install -y libqt4-dev 
#RUN apt-get install -y libqt4-opengl-dev
#RUN apt-get install -y libqglviewer-dev-qt4
RUN apt-get install -y libgoogle-glog-dev

RUN git clone --depth=1 https://ceres-solver.googlesource.com/ceres-solver && \
    cd ceres-solver && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make test && \
    make install

	
# Install python requirements
RUN	pip3 install Cython
RUN pip3 install cloudpickle
RUN pip3 install exifread
RUN pip3 install flask
RUN pip3 install fpdf2
RUN pip3 install joblib
RUN pip3 install gpxpy
RUN pip3 install matplotlib
RUN pip3 install networkx
RUN pip3 install Pillow
RUN pip3 install pyproj
RUN pip3 install pytest
RUN pip3 install python-dateutil
RUN pip3 install pyyaml
RUN pip3 install scipy
RUN pip3 install Sphinx
RUN pip3 install xmltodict
RUN pip3 install loky
RUN pip3 install six
RUN pip3 install wheel
RUN pip3 install dlib
				 
# opensfm
RUN git clone --recursive https://github.com/mapillary/OpenSfM && \
	cd OpenSfM && \
	git submodule update --init --recursive && \
	python3 setup.py build

# octomap
RUN git clone git://github.com/OctoMap/octomap.git && \
	cd octomap && \
	mkdir -p build && cd build && \
	cmake .. && \
	make install