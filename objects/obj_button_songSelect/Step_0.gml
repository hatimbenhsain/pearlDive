/// @description Insert description here
// You can write your code in this editor


if(active && selected){
	gameManager.startStage=0;
	gameManager.currentState=states.start;
	obj_settings.active=false;
}


// Inherit the parent event
event_inherited();

