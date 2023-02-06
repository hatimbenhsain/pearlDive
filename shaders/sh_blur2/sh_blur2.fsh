//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 size;

const float blurSteps=10.0;
uniform vec2 texelSize;
uniform float sigma;
uniform float blurVector;

float weight(float pos){	//Gauss 1D
	return exp(-(pos*pos)/(2.0*sigma*sigma));
}

void main()
{
	highp vec4 blurredCol=texture2D(gm_BaseTexture,v_vTexcoord);
	
	vec2 sample;
	float sampleWeight;
	float totalWeight=1.0;
	float kernel=2.0*blurSteps+1.0;
	vec2 texelSize2=texelSize/1000.0;
	
	for(float offset=1.0;offset<=blurSteps;offset++){
		sampleWeight=weight(offset/kernel);
		totalWeight+=2.0*sampleWeight;
		
		sample=v_vTexcoord-offset*texelSize2*blurVector;
		blurredCol+=texture2D(gm_BaseTexture,sample)*sampleWeight;
		
		sample=v_vTexcoord+offset*texelSize2*blurVector;
		blurredCol+=texture2D(gm_BaseTexture,sample)*sampleWeight;
	}
	
    gl_FragColor=v_vColour*blurredCol/totalWeight;
}
