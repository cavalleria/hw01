
find_package(GTest REQUIRED)

macro(hw_add_test name)
    add_executable(test_${name} test_${name}.cpp)
    target_include_directories(test_${name} PRIVATE ${CMAKE_SOURCE_DIR}/src)
    target_link_libraries(test_${name} PRIVATE hw stbiw GTest::gtest GTest::gtest_main)
    gtest_add_tests(TARGET test_${name})
endmacro()

hw_add_test(rainbow)
