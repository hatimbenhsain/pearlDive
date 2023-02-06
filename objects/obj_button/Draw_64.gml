/// @description Insert description here
// You can write your code in this editor

var sc=gameManager.screenScale

if(active){
	if(hovered){
		draw_sprite_ext(sprite_index,image_index,x*sc,y*sc,scale*1.1*sc,scale*1.1*sc,0,c_white,1);
	}else{
		draw_sprite_ext(sprite_index,image_index,x*sc,y*sc,scale*sc,scale*sc,0,c_white,1);
	}
}