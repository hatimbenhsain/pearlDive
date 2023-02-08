/// @description Insert description here
// You can write your code in this editor


if(active && selected){
	obj_settings.active=false;
	with(obj_gameManager){
		audio_resume_sound(timeKeeper.track);	
		timeKeeper.playing=true;	
	}
}


// Inherit the parent event
event_inherited();

