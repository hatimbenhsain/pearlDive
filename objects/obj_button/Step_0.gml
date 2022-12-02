/// @description Insert description here
// You can write your code in this editor

if(active){
	if(position_meeting(mouse_x,mouse_y,self)){
		hovered=true;	
	}else{
		hovered=false;	
	}

	selected=false;
	if(hovered && mouse_check_button_pressed(mb_left)){
		selected=true;
	}
}

