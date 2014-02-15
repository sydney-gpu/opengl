#version 330

layout(points) in;
layout(triangle_strip, max_vertices = 4) out;

in vec4 position[];
in float lifetime[];
in float lifespan[];

out vec4 Colour;

uniform mat4 projection;

uniform float sizeStart;
uniform float sizeEnd;

uniform vec4 colourStart;
uniform vec4 colourEnd;

void main( )
{
	// interpolate colour
	Colour = mix( colourStart, colourEnd, lifetime[0] / lifespan[0] );

	// calculate the size and create the corners of a quad
	float halfSize = mix( sizeStart, sizeEnd, lifetime[0] / lifespan[0] ) * 0.5f;

	vec4 corners[4];
	corners[0] = vec4( halfSize, -halfSize, 0, 0 ) + position[0];
	corners[1] = vec4( halfSize, halfSize, 0, 0 ) + position[0];
	corners[2] = vec4( -halfSize, -halfSize, 0, 0 ) + position[0];
	corners[3] = vec4( -halfSize, halfSize, 0, 0 ) + position[0];

	gl_Position = projection * corners[0];
	EmitVertex();

	gl_Position = projection * corners[1];
	EmitVertex();

	gl_Position = projection * corners[2];
	EmitVertex();

	gl_Position = projection * corners[3];
	EmitVertex();
}
