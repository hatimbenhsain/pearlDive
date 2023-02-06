/// @description Insert description here
// You can write your code in this editor

event_inherited()

if(active){
	var sc=gameManager.screenScale;
	draw_set_font(font_pixellariBig);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	draw_text(x*sc,(y+1)*sc,"START");
	draw_set_valign(fa_top);	
}
