/// @description Insert description here
// You can write your code in this editor

if(gameManager.currentState==states.start){
	if(position_meeting(mouse_x,mouse_y,self)){
		hovered=true;	
	}else{
		hovered=false;	
	}

	if(hovered && mouse_check_button_pressed(mb_left)){
		with(obj_instrument){
			selected=false;	
		}
		selected=true;
		obj_gameManager.currentInstrument=number;
	}
}