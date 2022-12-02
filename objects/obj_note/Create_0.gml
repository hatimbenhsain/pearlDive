/// @description Insert description here
// You can write your code in this editor

y=obj_tuner.notesY;
notesX=obj_tuner.notesX;
x=2000

spriteWidth=bbox_right-bbox_left;

timeKeeper=instance_find(obj_timeKeeper,0);

pixelsPerSec=spriteWidth/obj_tuner.timeWindows[obj_gameManager.difficultyLevel]
[array_length(obj_tuner.timeWindows[obj_gameManager.difficultyLevel])-1];

obj_gameManager.pixelsPerSec=pixelsPerSec;

scored=false;
scoredPrev=false;

spriteSet=false;

scoreValue=0;

disappearingTime=0.5;

targetx=x;
targety=y;
starty=y;
animationTime=0;
animationLength=0.35;

curve=animcurve_get(curve_ease);
channel1=animcurve_get_channel(curve,"curve1");
channel2=animcurve_get_channel(curve,"curve2");
channel3=animcurve_get_channel(curve,"curve3");
channel4=animcurve_get_channel(curve,"curve4");