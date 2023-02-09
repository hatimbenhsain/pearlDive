/// @description Insert description here
// You can write your code in this editor

notesY=obj_tuner.notesY;
notesX=obj_tuner.notesX;

diwaniyaX=obj_tuner.diwaniyaX;
diwaniyaY=obj_tuner.diwaniyaY;

gameW=display_get_width();
gameH=display_get_height();

guiW=display_get_gui_width();
guiH=display_get_gui_height();

ubloomDarken=shader_get_uniform(sh_bloom_blend,"bloomDarken");
ubloomSaturation=shader_get_uniform(sh_bloom_blend,"bloomSaturation");
ubloomTexture=shader_get_sampler_index(sh_bloom_blend,"bloomTexture");

ubloomTreshold=shader_get_uniform(sh_bloom_lum,"bloomTreshold");
ubloomRange=shader_get_uniform(sh_bloom_lum,"bloomRange");
ubloomIntensity=shader_get_uniform(sh_bloom_lum,"bloomIntensity");
umaskTransform=shader_get_uniform(sh_bloom_lum,"maskTransform");
umaskTexture=shader_get_sampler_index(sh_bloom_lum,"maskTexture");
maskTransfrom=[];

bloomTreshold=0.1;
bloomRange=0.1;
bloomIntensity=0.3;



GetMaskTransform=function(){
	maskTransform=[];
	var maskUV=sprite_get_uvs(spr_spotlight,spotlightIndex);
	var maskUVw=maskUV[2]-maskUV[0];
	var maskUVh=maskUV[3]-maskUV[1];
	var scaleX=sprite_get_width(spr_spotlight)/(guiW*2);
	var scaleY=sprite_get_height(spr_spotlight)/(guiH*2);
	scaleX=maskUVw;
	scaleY=maskUVh;
	maskTransform=[scaleX,scaleY,maskUV[0],maskUV[1]];
}



spotlight=true;
spotlightIndex=5;
spotlightAlpha=0.3;

bloomTexture=-1;
bloomDarken=1;
bloomSaturation=1;

usigma=shader_get_uniform(sh_blur2,"sigma");
utexelSize=shader_get_uniform(sh_blur2,"texelSize");
ublurVector=shader_get_uniform(sh_blur2,"blurVector");


sigma=0.8;
texelW=1000/guiW;
texelH=1000/guiH;


srf_ping=-1;
srf_pong=-1;


application_surface_draw_enable(false);

prevSpotlightIndex=spotlightIndex;
