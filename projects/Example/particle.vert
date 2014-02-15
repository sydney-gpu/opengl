#version 150

in vec3 Position;
in vec3 Velocity;
in float Lifetime;
in float Lifespan;

out vec3 position;
out float lifetime;
out float lifespan;

uniform mat4 view;

void main()
{
	position = (view * vec4(Position,1)).xyz;
	lifetime = Lifetime;
	lifespan = Lifespan;
}