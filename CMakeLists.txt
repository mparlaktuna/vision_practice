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

find_package(spdlog REQUIRED)

enable_testing()

find_package(GTest REQUIRED)
include(GoogleTest)

include_directories(include)

add_executable(compile_link test/compile_link.cpp)
target_link_libraries(compile_link  ${OpenCV_LIBRARIES} gtest gtest_main pthread)
add_test(NAME CompileLink
         COMMAND compile_link)

add_executable(opencv test/opencv.cpp)
target_link_libraries(opencv  ${OpenCV_LIBRARIES} spdlog::spdlog gtest gtest_main pthread)
add_test(NAME opencv
  COMMAND opencv
  WORKING_DIRECTORY /app/test_env)

gtest_discover_tests(opencv
  WORKING_DIRECTORY /app/test_env)
