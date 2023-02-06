/// @description Insert description here
// You can write your code in this editor
//var sc=obj_gameManager.screenScale;

//if(timeKeeper.playing){
//	draw_sprite_ext(sprite_index,image_index,x*sc,y*sc,sc,sc,0,c_white,image_alpha);
//}
var sc=obj_gameManager.screenScale

if(timeKeeper.playing){
	draw_sprite_ext(sprite_index,image_index,x*sc,y*sc,sc,sc,0,c_white,image_alpha);
}

if(scored){
	var t="";
	switch(scoreValue){
		case 2:
			t="Good!"
			break;
		case 1:
			t="Great!";
			break;
		case 0:
			t="Perfect!"
			break;
	}
	draw_set_font(font_pixellariSmall);
	draw_set_halign(fa_center);
	draw_set_alpha(image_alpha);
	draw_text(sc*notesX,sc*(starty-28-(1-image_alpha)*5),t);
	draw_set_alpha(1);
}