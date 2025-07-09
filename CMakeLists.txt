cmake_minimum_required(VERSION 3.28)
project(clox C)
set(CMAKE_C_STANDARD 23)

# Add include directory
include_directories(include)

# Gather all .c source files
file(GLOB SOURCES "src/*.c")

# Build clox executable
add_executable(clox ${SOURCES})
