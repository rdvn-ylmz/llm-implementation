cmake_minimum_required(VERSION 3.20)

project(llm_implementation C)
include(CTest)


set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)


add_executable(llm_implementation
      src/main.c
)
option(ENABLE_ASAN "Enable AddressSanitizer" OFF)
option(ENABLE_UBSAN "Enable UndefinedBehaviorSanitizer" OFF)

target_include_directories(llm_implementation
      PRIVATE ${CMAKE_SOURCE_DIR}/include
)

if(CMAKE_C_COMPILER_ID MATCHES "GNU|Clang")
      if(ENABLE_ASAN)
          target_compile_options(llm_implementation PRIVATE
              -fsanitize=address
              -fno-omit-frame-pointer
              -g
          )
          target_link_options(llm_implementation PRIVATE
              -fsanitize=address
          )
      endif()

      if(ENABLE_UBSAN)
          target_compile_options(llm_implementation PRIVATE
              -fsanitize=undefined
              -fno-omit-frame-pointer
              -g
          )
          target_link_options(llm_implementation PRIVATE
              -fsanitize=undefined
          )
      endif()
endif()

if(BUILD_TESTING)
      add_test(NAME llm_implementation_runs COMMAND llm_implementation)
endif()
