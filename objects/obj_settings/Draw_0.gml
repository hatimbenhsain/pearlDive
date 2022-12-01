/// @description Insert description here
// You can write your code in this editor
if(active){	
	draw_sprite(spr_bg,0,0,0);
	draw_set_color(c_black);
	draw_line_width(diffSliderX-diffSliderLength/2,diffSliderY,diffSliderX+diffSliderLength/2,
	diffSliderY,diffSliderThickness);
	draw_set_color(c_white);
	draw_sprite(spr_note,0,diffX,diffSliderY);
	
	if(retryButtonActive){
		draw_set_color(c_green);
		draw_rectangle(retryButtonX-retryButtonW/2,retryButtonY-retryButtonH/2,
		retryButtonX+retryButtonW/2,retryButtonY+retryButtonH/2,false)
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_text(retryButtonX-10,retryButtonY,"retry");
	}
	
	draw_set_color(c_white);
}

