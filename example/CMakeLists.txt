cmake_minimum_required(VERSION 3.12)

project(hw_example)

set(CMAKE_CXX_STANDARD 11)

add_executable(use_hw use_hw.cpp)
target_include_directories(
    use_hw
    PRIVATE
    ${CMAKE_SOURCE_DIR}/src)
target_link_libraries(use_hw PUBLIC hw stbiw)
