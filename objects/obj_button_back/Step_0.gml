/// @description Insert description here
// You can write your code in this editor


if(gameManager.currentState==states.start  && gameManager.startStage>0){
	active=true;
}else{
	active=false;	
}

if(active && selected){
	gameManager.startStage-=1;
}


// Inherit the parent event
event_inherited();

