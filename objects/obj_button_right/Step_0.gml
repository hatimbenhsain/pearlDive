/// @description Insert description here
// You can write your code in this editor


if(gameManager.currentState==states.start  && gameManager.startStages[gameManager.startStage]=="song"
&& !gameManager.info.active){
	active=true;	
}else{
	active=false;	
}

if(active && selected){
	gameManager.songIndex=(gameManager.songIndex+1)%array_length(gameManager.songs);
}


// Inherit the parent event
event_inherited();

