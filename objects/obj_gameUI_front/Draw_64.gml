/// @description Insert description here
// You can write your code in this editor

var tk=gameManager.timeKeeper
var sc=gameManager.screenScale
if(gameManager.currentState==states.playing){
	draw_set_font(font_pixellariMedium);
	draw_set_halign(fa_left);
	draw_text(sc*5,sc*5,tk.songPosition);
	draw_set_halign(fa_right);
	draw_text(sc*(room_width-5),sc*5,gameManager.currentScore);
}else if(gameManager.currentState==states.ended){
	draw_set_font(font_pixellariBig);
	draw_set_halign(fa_center);
	draw_text(sc*room_width/2,sc*(room_height/2-35),"score:");
	draw_text(sc*(room_width/2),sc*room_height/2,gameManager.currentScore);
}

