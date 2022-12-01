/// @description Insert description here
// You can write your code in this editor
var screenScale=gameManager.screenScale;

if(gameManager.currentState==states.start){
	
	var anyHovered=false;
	with(obj_instrument){
		if(hovered){
			anyHovered=true;
			break;
		}
	}

	if(hovered || (selected && !anyHovered)){
		draw_set_font(font_pixellariBig);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_text_ext(screenScale*room_width/2,screenScale*115,name,screenScale*5,screenScale*200);
		draw_set_font(font_pixellariMedium);
		draw_set_halign(fa_left);
		draw_text_ext(screenScale*(room_width/2-100),screenScale*140,description,screenScale*15,screenScale*200);
	}

}

