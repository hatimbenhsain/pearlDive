/// @description Insert description here
// You can write your code in this editor
if(gameManager.settings.active){
	active=true;	
}else{
	active=false;	
}

if(active && selected){
	on=!on;
}


// Inherit the parent event
event_inherited();



