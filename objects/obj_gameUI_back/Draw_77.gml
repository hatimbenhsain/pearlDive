/// @description Insert description here
// You can write your code in this editor
var tk=gameManager.timeKeeper

if(!surface_exists(srf_ping)){
	srf_ping=surface_create(guiW,guiH);	
	maskTexture=sprite_get_texture(spr_spotlight,spotlightIndex);
}
if(!surface_exists(srf_pong)){
	srf_pong=surface_create(guiW,guiH);	
	//bloomTexture=surface_get_texture(srf_pong);
}



if(gameManager.currentState==states.playing && !gameManager.settings.active && spotlight){
	
	shader_set(sh_bloom_lum);
	GetMaskTransform();
	shader_set_uniform_f(ubloomIntensity,bloomIntensity);
	shader_set_uniform_f(ubloomRange,bloomRange);
	shader_set_uniform_f(ubloomTreshold,bloomTreshold);
	shader_set_uniform_f_array(umaskTransform,maskTransform);
	texture_set_stage(umaskTexture,maskTexture);
	surface_set_target(srf_ping);
	if(spotlightIndex!=prevSpotlightIndex){
		draw_clear_alpha(c_white, 0);
	}
	draw_surface(application_surface,0,0);
	surface_reset_target();

	gpu_set_tex_filter(true);


	shader_set(sh_blur2);
	shader_set_uniform_f(utexelSize,texelW,texelH);
	shader_set_uniform_f(usigma,sigma);
	shader_set_uniform_f(ublurVector,1,0);
	surface_set_target(srf_pong);
	if(spotlightIndex!=prevSpotlightIndex){
		draw_clear_alpha(c_white, 0);
	}
	draw_surface(srf_ping,0,0);
	shader_set_uniform_f(ublurVector,0,1);
	surface_reset_target();
	surface_set_target(srf_ping);
	draw_surface(srf_pong,0,0);
	surface_reset_target();
	shader_reset();

	gpu_set_tex_filter(false);
	
	draw_surface_stretched(application_surface,0,0,guiW,guiH);
	gpu_set_blendmode(bm_add);
	draw_surface_stretched(srf_ping,0,0,guiW,guiH);
	gpu_set_blendmode(bm_normal);
	
}else{
	draw_surface_stretched(application_surface,0,0,guiW,guiH);
}

//shader_set(sh_bloom_blend);
//shader_set_uniform_f(ubloomIntensity,bloomIntensity);
//shader_set_uniform_f(ubloomDarken,bloomDarken);
//shader_set_uniform_f(ubloomRange,bloomRange);
//texture_set_stage(ubloomTexture,bloomTexture);
//draw_surface_stretched(application_surface,0,0,guiW,guiH);
//shader_reset();

prevSpotlightIndex=spotlightIndex;

