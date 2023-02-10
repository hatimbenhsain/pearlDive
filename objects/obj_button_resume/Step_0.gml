/// @description Insert description here
// You can write your code in this editor


if(active && selected){
	obj_settings.active=false;
	with(obj_gameManager){
		ResumeMusic();
	}
}


// Inherit the parent event
event_inherited();

