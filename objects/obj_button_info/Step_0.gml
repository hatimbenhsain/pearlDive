/// @description Insert description here
// You can write your code in this editor


if(gameManager.currentState==states.start && !gameManager.info.active){
	active=true;	
}else if(gameManager.currentState==states.start){
	active=false;	
}

if(active && selected){
	//gameManager.songIndex=(gameManager.songIndex+1)%array_length(gameManager.songs);
	with(obj_info){
		active=true;	
	}
}


// Inherit the parent event
event_inherited();

