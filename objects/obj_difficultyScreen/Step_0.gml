
diffX=diffSliderX+diffSliderLength*(diffSliderPosition-1/2);		//x for difficulty slider 

if(prevActive!=active){
	prevDiffLevel=obj_gameManager.difficultyLevel;
}

if(active){
	if(mouse_check_button_pressed(mb_left)){
		if(CheckCollisionPoint(mouse_x,mouse_y,diffX,diffSliderY,
		sprite_get_bbox_right(spr_note)-sprite_get_bbox_left(spr_note),
		sprite_get_bbox_bottom(spr_note)-sprite_get_bbox_top(spr_note))){
			diffSliderDragged=true;
			mouseOffsetX=mouse_x-diffX;
		}
	}else if(mouse_check_button(mb_left)){
		if(diffSliderDragged){	//	snap the slider to pre set difficulty levels
			diffX=clamp(mouse_x-mouseOffsetX,diffSliderX-diffSliderLength/2,
			diffSliderX+diffSliderLength/2);
			diffSliderPosition=1/2+(diffX-diffSliderX)/diffSliderLength;
			diffSliderPosition=floor(diffSliderPosition*(array_length(obj_gameManager.timeWindows)-1))
			/(array_length(obj_gameManager.timeWindows)-1);
			diffX=diffSliderX+diffSliderLength*(diffSliderPosition-1/2);		
		}
	}else if(mouse_check_button_released(mb_left)){
		diffSliderDragged=false;
		obj_gameManager.difficultyLevel=floor(diffSliderPosition*(array_length(obj_gameManager.timeWindows)-1));
	}
}

prevActive=active;