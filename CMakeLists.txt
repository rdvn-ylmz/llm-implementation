cmake_minimum_required(VERSION 3.20)

project(llm_implementation C)
include(CTest)


set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)


add_executable(llm_implementation
      src/main.c
)

target_include_directories(llm_implementation
      PRIVATE ${CMAKE_SOURCE_DIR}/include
)


target_compile_options(llm_implementation PRIVATE
      -Wall
      -Wextra
      -Wpedantic
)

if(BUILD_TESTING)
      add_test(NAME llm_implementation_runs COMMAND llm_implementation)
endif()
