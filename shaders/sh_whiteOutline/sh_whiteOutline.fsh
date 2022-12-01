//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelH;
uniform float pixelW;

void main()
{
	vec2 offsetx;
	offsetx.x=pixelW*1.0;
	vec2 offsety;
	offsety.y=pixelH*1.0;
	
	float alpha=texture2D(gm_BaseTexture,v_vTexcoord).a;
	
	bool isEmpty=false;
	
	if(alpha==0.0){
		gl_FragColor=vec4(1.0,1.0,1.0,alpha);	
		isEmpty=true;
	}else{
		gl_FragColor = v_vColour*texture2D(gm_BaseTexture,v_vTexcoord);
	}
	
	alpha+=ceil(texture2D(gm_BaseTexture,v_vTexcoord+offsetx).a);	
	alpha+=ceil(texture2D(gm_BaseTexture,v_vTexcoord-offsetx).a);
	//alpha+=ceil(texture2D(gm_BaseTexture,v_vTexcoord+offsetx+offsety).a);	
	//alpha+=ceil(texture2D(gm_BaseTexture,v_vTexcoord+offsetx-offsety).a);	
	//alpha+=ceil(texture2D(gm_BaseTexture,v_vTexcoord-offsetx+offsety).a);	
	//alpha+=ceil(texture2D(gm_BaseTexture,v_vTexcoord-offsetx-offsety).a);	
	alpha+=ceil(texture2D(gm_BaseTexture,v_vTexcoord+offsety).a);	
	alpha+=ceil(texture2D(gm_BaseTexture,v_vTexcoord-offsety).a);	
	
	if(isEmpty && alpha>0.0){
		//alpha=0.6;
	}
	
	gl_FragColor.a=alpha;
}
