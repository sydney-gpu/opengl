#version 150

in vec3 Position;
in vec3 Velocity;
in float Lifetime;
in float Lifespan;

out vec3 position;
out vec3 velocity;
out float lifetime;
out float lifespan;

uniform float time;
uniform float deltaTime;

uniform float lifeMin;
uniform float lifeMax;

uniform float velocityMin;
uniform float velocityMax;

uniform vec3 emitterPosition;

const float INVERSE_MAX_UINT = 1.0f / 4294967295.0f;

float rand(uint seed, float range)
{
	uint i = (seed ^ 12345391u) * 2654435769u;
	i ^= (i<<6u) ^ (i>>26u);
	i *= 2654435769u;
	i += (i<<5u) ^ (i>>12u);
	return float(range * i) * INVERSE_MAX_UINT;
}

void main()
{
	position = Position + Velocity * deltaTime;
	velocity = Velocity;
	lifetime = Lifetime + deltaTime;
	lifespan = Lifespan;
	
	// emit a new particle as soon as it dies
	if (lifetime > lifespan) 
	{
		uint seed = uint(time * 1000.0) + uint(gl_VertexID);

		velocity.x = rand(seed++, 2) - 1;
		velocity.y = rand(seed++, 2) - 1;
		velocity.z = rand(seed++, 2) - 1;

		velocity = normalize( velocity ) * mix( velocityMin, velocityMax, rand(seed++, 1.0f) );

		position = emitterPosition;

		lifetime = 0;

		lifespan = mix(lifeMin, lifeMax, rand(seed++, 1.0f));
	}
}