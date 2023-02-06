/// @description Insert description here
// You can write your code in this editor


if(gameManager.currentState==states.start  && gameManager.startStage<array_length(gameManager.startStages)-1){
	active=true;	
}else{
	active=false;	
}

if(active && selected){
	gameManager.startStage+=1;
	show_debug_message("next");
}


// Inherit the parent event
event_inherited();

