#version 330

layout( location = 0 ) in vec3 Position;
layout( location = 1 ) in vec3 Velocity;
layout( location = 2 ) in float Lifetime;
layout( location = 3 ) in float Lifespan;

out vec4 position;
out float lifetime;
out float lifespan;

uniform mat4 view;

void main()
{
	position = view * vec4(Position,1);
	lifetime = Lifetime;
	lifespan = Lifespan;
}