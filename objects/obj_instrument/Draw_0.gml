/// @description Insert description here
// You can write your code in this editor

//if(gameManager.currentState==states.start){

	if(selected){
		shader_set(sh_whiteOutline);
		shader_set_uniform_f(upixelW,texelW);
		shader_set_uniform_f(upixelH,texelH);
	}

	if(hovered){
		draw_sprite_ext(sprite_index,image_index,x,y,scale*1.2,scale*1.2,0,c_white,1);
	}else{
		draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,1);
	}

	shader_reset();

//}

