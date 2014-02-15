#ifndef __ExampleApp_H_
#define __ExampleApp_H_

#include <glm/glm.hpp>

#include "Application.h"
#include "GPUParticleSystem.h"

// Derived application class that wraps up all globals neatly
class ExampleApp : public Application
{
public:

	ExampleApp();
	virtual ~ExampleApp();

protected:

	virtual bool onCreate(int a_argc, char* a_argv[]);
	virtual void onUpdate(float a_deltaTime);
	virtual void onDraw();
	virtual void onDestroy();

	glm::mat4	m_cameraMatrix;
	glm::mat4	m_projectionMatrix;

	GPUParticleEmitter*	m_emitter;
};

#endif // __ExampleApp_H_