/// @description Insert description here
// You can write your code in this editor
if(gameManager.currentState==states.ended){
	active=true;	
}else{
	active=false;	
}

if(active && selected){
	obj_settings.active=false;
	Retry();
}


// Inherit the parent event
event_inherited();

