/// @description Insert description here
// You can write your code in this editor



scale=1;

SetShaders();

hovered=false;
selected=false;

gameManager=instance_find(obj_gameManager,0);

y=65;

targetx=x;
x=x+room_width;
startx=x;

targety=y;
starty=y;

curve=animcurve_get(curve_ease);
channel=animcurve_get_channel(curve,"curve1");

animLength=0.5;
animTime=0;

dumSample=snd_drum1;
takSample=snd_drum2;

