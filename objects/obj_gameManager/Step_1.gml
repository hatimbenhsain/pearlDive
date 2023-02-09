/// @description Insert description here
// You can write your code in this editor
// Find timekeeper 
if(timeKeeper==noone){
	timeKeeper=instance_find(obj_timeKeeper,0);
	uiFront.timeKeeper=timeKeeper;
	uiBack.timeKeeper=timeKeeper;
}
// Find settings
if(settings==noone){
	settings=instance_find(obj_settings,0);
	show_debug_message("get settings");
}

if(info==noone){
	info=instance_find(obj_info,0);	
	show_debug_message("get info");
}
