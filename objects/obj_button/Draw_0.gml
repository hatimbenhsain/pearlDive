/// @description Insert description here
// You can write your code in this editor

if(active){
	if(hovered){
		draw_sprite_ext(sprite_index,image_index,x,y,scale*1.1,scale*1.1,0,c_white,1);
	}else{
		draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,1);
	}
}

