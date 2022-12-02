/// @description Insert description here
// You can write your code in this editor
animTime=0;
animLength=obj_tuner.penaltyTime;

instrumScale=1;


notesX=obj_tuner.notesX;
notesY=obj_tuner.notesY;

curve=animcurve_get(curve_ease);
channel2=animcurve_get_channel(curve,"curve2");