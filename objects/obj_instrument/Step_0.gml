/// @description Insert description here
// You can write your code in this editor
animTime+=delta_time/1000000;

if(animTime<animLength){
	x=startx+(targetx-startx)*animcurve_channel_evaluate(channel,animTime/animLength);
	y=starty+(targety-starty)*animcurve_channel_evaluate(channel,animTime/animLength);
}else{
	x=targetx
	y=targety;
	startx=x;
	starty=y;
}
	

if(gameManager.currentState==states.start && x==targetx){
	
	if(position_meeting(mouse_x,mouse_y,self)){
		if(!hovered){
			targety=targety-5;
			animTime=0;
		}
		hovered=true;	
	}else{
		if(hovered){
			targety=targety+5;
			animTime=0;
		}
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