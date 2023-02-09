/// @description Insert description here
// You can write your code in this editor
show_debug_message(depth);
show_debug_message(gameManager.depth);
if(gameManager.currentState==states.start  && gameManager.startStages[gameManager.startStage]=="song"
&& gameManager.info.active==false){
	active=true;	
}else{
	active=false;	
}

if(active && selected){
	gameManager.songIndex=(gameManager.songIndex-1+array_length(gameManager.songs))%array_length(gameManager.songs);
}


// Inherit the parent event
event_inherited();

