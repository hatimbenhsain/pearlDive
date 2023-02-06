//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 size;

const int quality=16;
const int directions=12;
const float tau=6.28318530718;//pi * 2

void main()
{
	vec2 radius=size.z/size.xy;
	vec4 Color=texture2D(gm_BaseTexture,v_vTexcoord);
	
	for(float d=0.0;d<tau;d+=tau/float(directions)){
		for(float i=1.0/float(quality);i<=1.0;i+=1.0/float(quality)){
			Color+=texture2D(gm_BaseTexture,v_vTexcoord+vec2(cos(d),sin(d))*radius*i);
		}
	}

	Color=Color/(float(quality)*float(directions)+1.0);
    gl_FragColor=v_vColour*Color;
}
