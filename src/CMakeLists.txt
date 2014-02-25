set(INCLUDE_DIRS
  ${CMAKE_SOURCE_DIR}/dep/glew-1.10.0/include  
  ${CMAKE_SOURCE_DIR}/dep/glfw-3.0.4/include
  ${CMAKE_SOURCE_DIR}/dep/glm

  ${CMAKE_SOURCE_DIR}/inc
  ${CMAKE_SOURCE_DIR}/projects/Example
)

set(SRC_DIRS
  ${CMAKE_SOURCE_DIR}/projects/Example/*.cpp
  ${CMAKE_SOURCE_DIR}/src/*.cpp
  ${CMAKE_SOURCE_DIR}/dep/glew-1.10.0/src/glew.c
)

include_directories(${INCLUDE_DIRS})
file(GLOB SRC_FILES ${SRC_DIRS})
add_executable(${CMAKE_PROJECT_NAME} ${SRC_FILES})
target_link_libraries(${CMAKE_PROJECT_NAME} glfw ${GLFW_LIBRARIES} ${OPENGL_LIBRARIES})
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
