/// @description Insert description here
// You can write your code in this editor
if(active){	
	draw_set_color(c_white);
	//draw_sprite(spr_bg,0,0,0);
	//draw_set_color(c_black);
	draw_line_width(diffSliderX-diffSliderLength/2,diffSliderY,diffSliderX+diffSliderLength/2,
	diffSliderY,diffSliderThickness);
	draw_set_color(c_white);
	draw_sprite(spr_note,0,diffX,diffSliderY);

	
	draw_set_color(c_white);
	draw_set_font(font_pixellariMedium);
	
}

