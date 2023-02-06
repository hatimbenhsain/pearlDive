//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec2 v_Maskcoord;
varying vec4 v_vColour;

uniform float bloomTreshold;
uniform float bloomRange;
uniform float bloomIntensity;

uniform sampler2D maskTexture;

void main()
{
	vec4 baseColor=v_vColour*texture2D(gm_BaseTexture,v_vTexcoord);
	
	float maskVal=texture2D(maskTexture,v_Maskcoord).a; //should be maskTexture
	
	if(maskVal<0.3){
		float lum=dot(baseColor.rgb,vec3(0.229,0.587,0.114)); //Calculate luminance
		float weight=smoothstep(bloomTreshold,bloomTreshold+bloomRange,lum);
		baseColor.rgb=mix(vec3(0.0),baseColor.rgb,weight);
		baseColor.a=bloomIntensity*baseColor.a;
	}else{
		baseColor.a=0.0;
	}
	
    gl_FragColor=baseColor;

}
