/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(on!=prevOn){
	var o=on;
	with(obj_gameUI_back){
		spotlight=o;	
	}
}

prevOn=on;