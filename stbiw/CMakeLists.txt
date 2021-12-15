project(stbiw LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)

# Build stbiw shared library
#add_library(
#    ${PROJECT_NAME}
#    SHARED
#    ${CMAKE_CURRENT_SOURCE_DIR}/src/stb_image_write.cpp
#)
#target_include_directories(
#    ${PROJECT_NAME}
#    PUBLIC
#    ${CMAKE_CURRENT_SOURCE_DIR}/include
#)

# Build stbiw static library
add_library(
    ${PROJECT_NAME}
    STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/src/stb_image_write.cpp
)

target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

