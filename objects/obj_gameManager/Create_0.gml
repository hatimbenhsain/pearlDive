/// @description Insert description here
// You can write your code in this editor
timeKeeper=noone;
settings=noone;

timeWindows=obj_tuner.timeWindows;
scores=obj_tuner.scores;

difficultyLevel=1;

currentScore=0;
scoreToAdd=0;
lastScoreTime=0;
lastScoreLength=0.5;

notes=ds_list_create();

buttons1=[ord("Z"),ord("X")];
buttons2=[mb_left,mb_right];

cooldown=0;
penaltyTime=obj_tuner.penaltyTime;

lastSongPosition=0;
lastClick=0;

midiTracks=ParseMidi("music3.txt");

uiFront=instance_create_depth(x,y,depth-2,obj_gameUI_front);
uiBack=instance_create_depth(x,y,depth,obj_gameUI_back);
uiBack.gameManager=self;
uiFront.gameManager=self;

currentInstrument=-1;
instrumentNumber=6;

enum states {
	start,
	playing,
	paused,
	ended
}

song=snd_backingTrack1;



for(var i=0;i<instrumentNumber;i++){
	var xx=54*(i+0.5-instrumentNumber/2)+room_width/2;
	instance_create_depth(xx,room_height/2,depth-1.9,asset_get_index("obj_instrument"+string(i+1)));	
}

screenScale=display_get_gui_width()/room_width;

currentState=states.start;


claps=true;
clapSprites=[spr_hands1,spr_hands2,spr_hands3,spr_hands1,spr_hands2,spr_hands3,spr_hands2,spr_hands3,spr_hands1];

musicians=[
{
	spr:spr_musician1,
	x:-53,
	y:6
},
{
	spr:spr_musician2,
	x:-33,
	y:-4
},
{
	spr:spr_musician3,
	x:-12,
	y:-12
},
{
	spr:spr_musician4,
	x:13,
	y:-12
},
{
	spr:spr_musician5,
	x:34,
	y:-4
},
{
	spr:spr_musician6,
	x:54,
	y:6
},];

array_foreach(musicians,function(m,i){
	m.time=0;
	m.image=0;
	m.lastImg=0;
	m.noteIndex=0;
})