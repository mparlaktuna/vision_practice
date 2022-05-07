FROM ubuntu:focal
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install --no-install-recommends -y g++-11 wget git make cppcheck && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 20 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 20

RUN apt-get -y update && apt-get install -y --no-install-recommends ca-certificates git libjpeg8-dev libpng-dev \
    libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev \
    libxine2-dev libv4l-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    libgtk-3-dev libtbb-dev qt5-default libatlas-base-dev libfaac-dev libmp3lame-dev libtheora-dev \
    libvorbis-dev libxvidcore-dev libopencore-amrnb-dev libopencore-amrwb-dev libavresample-dev \
    x264 v4l-utils libgoogle-glog-dev libgflags-dev libgphoto2-dev libeigen3-dev libhdf5-dev \
    tesseract-ocr libtesseract-dev cmake

WORKDIR /programs
RUn git clone https://github.com/opencv/opencv.git && git clone https://github.com/opencv/opencv_contrib.git
RUN cd /programs/opencv && mkdir build && cd build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
          -D INSTALL_C_EXAMPLES=OFF \
          -D INSTALL_PYTHON_EXAMPLES=OFF \
          -D WITH_TBB=ON \
          -D WITH_V4L=ON \
          -D WITH_QT=OFF \
          -D WITH_OPENGL=ON \
          -D BUILD_EXAMPLES=OFF \
	  -D BUILD_JAVA=OFF \
	  -D BUILD_opencv_python=OFF\
	  -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
	  -D CMAKE_INSTALL_PREFIX=/opt/opencv \
	  .. && \
	  make -j4 && make install

RUN apt-get -y install libgtest-dev libspdlog-dev
RUN cd /usr/src/gtest && cmake CMakeLists.txt && make && cp lib/*.a /usr/lib
COPY build_test.sh /build_test.sh
ENTRYPOINT ["/build_test.sh"]
