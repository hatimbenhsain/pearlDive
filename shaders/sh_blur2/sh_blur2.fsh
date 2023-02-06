//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 size;

uniform float blurSteps;
uniform float texelSize;
uniform float sigma;
uniform float blurVector;

float weight(float pos){	//Gauss 1D
	return exp(-(pos*pos)/(2.0*sigma*sigma));
}

void main()
{
	highp vec4 blurredCol=texture2D(gm_BaseTexture,v_vTexcoord);
	
	vec2 sample;
	float offset, sampleWeight;
	float totalWeight=1.0;
	float kernel=2.0*blurSteps+1.0;
	
	for(offset=1.0;offset<=blurSteps;offset++){
		sampleWeight=weight(offset/kernel);
		totalWeight+=2.0*sampleWeight;
		
		sample=v_vTexcoord-offset*texelSize*blurVector;
		blurredCol+=texture2D(gm_BaseTexture,sample)*sampleWeight;
		
		sample=v_vTexcoord+offset*texelSize*blurVector;
		blurredCol+=texture2D(gm_BaseTexture,sample)*sampleWeight;
	}
	
    gl_FragColor=v_vColour*blurredCol/totalWeight;
}
