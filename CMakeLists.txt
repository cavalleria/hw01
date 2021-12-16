cmake_minimum_required(VERSION 3.12)

if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "FATAL: Building inplace are not allowed. You should create a separate directory for Building.")
endif()

if(NOT DEFINED CMAKE_INSTALL_PREFIX)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE PATH "Installation Directory")
endif()
message(STATUS "CMAKE_INSTALL_PREFIX = ${CMAKE_INSTALL_PTRFIX}")

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

project(hw)

set(CMAKE_CXX_STANDARD 11)

option(HW_TEST "Build unit tests?" ON)
option(HW_COVERAGE "Build unit coverage?" ON)

add_subdirectory(stbiw)

aux_source_directory(
    ${CMAKE_SOURCE_DIR}/src
    HW_SRCS
)
add_library(
    ${PROJECT_NAME}
    STATIC
    ${HW_SRCS}
)
target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
    ${HW_SRCS} stbiw/include
)

if(HW_COVERAGE)
    target_compile_options(${PROJECT_NAME} PUBLIC -coverage -fprofile-arcs -ftest-coverage)
    target_link_libraries(${PROJECT_NAME} PUBLIC -coverage)
endif()

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/summary.cmake")

add_subdirectory(example)

install(
    TARGETS ${PROJECT_NAME}
    DESTINATION lib
)

if(HW_TEST)
    enable_testing()
    add_subdirectory(tests)
endif()
