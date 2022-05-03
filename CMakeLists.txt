cmake_minimum_required(VERSION 3.16)
cmake_policy(SET CMP0079 NEW)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 20)

project(vision_learning)

set(OpenCV_PREFIX /opt/opencv)
find_package(OpenCV REQUIRED
  PATHS ${OpenCV_PREFIX}/lib/cmake/
  ${OpenCV_PREFIX}/share/OpenCV/
  NO_DEFAULT_PATH)
include_directories(${OPENCV_ROOT}/include)
add_definitions(-DCONFIG_OPENCV)


add_executable(linking_test test/linking.cpp)
# target_link_directories(linking_test ${OpenCV_LIBRARIES})
