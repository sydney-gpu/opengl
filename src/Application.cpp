#include "Application.h"
#include "Utilities.h"
#include <string>
#include <vector>
#include <sstream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>

bool Application::create(const char* a_name, int a_width, int a_height, int a_argc, char* a_argv[])
{
	// initialise glfw systems
	if (glfwInit() != GL_TRUE)
		return false;
    
#ifdef __APPLE__
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
#endif
    
	// create a windowed mode window and its OpenGL context
	m_window = glfwCreateWindow(a_width, a_height, a_name, nullptr, nullptr);
	if (m_window == nullptr)
	{
		glfwTerminate();
		return false;
	}
    
    int major = glfwGetWindowAttrib(m_window, GLFW_CONTEXT_VERSION_MAJOR);
    int minor = glfwGetWindowAttrib(m_window, GLFW_CONTEXT_VERSION_MINOR);
    int revision = glfwGetWindowAttrib(m_window, GLFW_CONTEXT_REVISION);
    printf("GL %i.%i.%i\n",major,minor,revision);

	// make the window's context current
	glfwMakeContextCurrent(m_window);

	// initialise glew systems to wrangle GL extensions
    glewExperimental = GL_TRUE;
	if (glewInit() != GLEW_OK)
	{
		glfwTerminate();
		return false;
	}

	bool result = onCreate(a_argc,a_argv);
	if (result == false)
	{
		glfwTerminate();
	}
	return result;
}

void Application::run()
{
	Utility::resetTimer();
	m_running = true;
	do
	{
		float deltaTime = Utility::tickTimer();

		onUpdate( deltaTime );

		onDraw();

		glfwSwapBuffers(m_window);
		glfwPollEvents();

	} while (m_running == true && glfwWindowShouldClose(m_window) == 0);

	onDestroy();

	glfwTerminate();
}