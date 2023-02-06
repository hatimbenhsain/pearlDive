//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float bloomIntensity;
uniform float bloomDarken;
uniform float bloomSaturation;
uniform sampler2D bloomTexture;

void main()
{
	vec4 baseColor=texture2D(gm_BaseTexture,v_vTexcoord);
	vec3 bloomColor=texture2D(bloomTexture,v_vTexcoord).rgb;
	
	//saturate color
	float lum=dot(bloomColor,vec3(0.299,0.587,0.114));
	bloomColor=mix(vec3(lum),bloomColor,bloomSaturation);
	
	//add (linear dodge)
	baseColor.rgb=baseColor.rgb*bloomDarken+bloomColor*bloomIntensity;
	
    gl_FragColor=v_vColour*baseColor;
}
