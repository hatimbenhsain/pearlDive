/// @description Insert description here
// You can write your code in this editor

if(on) image_index=1;
else image_index=0;

event_inherited()

if(active){
	var sc=gameManager.screenScale;
	draw_set_font(font_pixellariMedium);
	draw_set_valign(fa_center);
	draw_set_halign(fa_left);
	if(on)	draw_set_color(c_white);
	else draw_set_color(c_gray);
	draw_text(sc*(x+15),sc*(y),text);
	draw_set_valign(fa_top);	
}
 

