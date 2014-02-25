project(sgpu-opengl)

cmake_minimum_required(VERSION 2.8.0)

find_package(OpenGL REQUIRED)
add_subdirectory(${CMAKE_SOURCE_DIR}/dep/glfw-3.0.4)

set(CMAKE_CXX_FLAGS "-Wall -Wextra -std=c++0x")
set(CMAKE_EXE_LINKER_FLAGS "-lm -lX11 -lXi -lXmu -lGL")
add_definitions(-DGLM_SWIZZLE -DGLM_FORCE_RADIANS -DGLEW_STATIC)

subdirs(src)
