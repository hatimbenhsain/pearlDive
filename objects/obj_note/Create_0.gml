/// @description Insert description here
// You can write your code in this editor

y=144;
x=2000

spriteWidth=bbox_right-bbox_left;

timeKeeper=instance_find(obj_timeKeeper,0);

pixelsPerSec=spriteWidth/obj_tuner.timeWindows[obj_gameManager.difficultyLevel]
[array_length(obj_tuner.timeWindows[obj_gameManager.difficultyLevel])-1];

obj_gameManager.pixelsPerSec=pixelsPerSec;

scored=false;
scoredPrev=false;

spriteSet=false;

