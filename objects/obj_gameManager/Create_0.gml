/// @description Insert description here
// You can write your code in this editor
timeKeeper=noone;
settings=noone;
info=noone;

timeWindows=obj_tuner.timeWindows;
scores=obj_tuner.scores;

difficultyLevel=1;

currentScore=0;
detailScores={
	perfect:0,
	great:0,
	good:0,
	miss:0
}
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



uiFront=instance_create_depth(x,y,depth-2,obj_gameUI_front);
uiBack=instance_create_depth(x,y,depth,obj_gameUI_back);
uiBack.gameManager=self;
uiFront.gameManager=self;

currentInstrument=-1;
currentInstrumentObj=-1;
instrumentNumber=6;

enum states {
	start,
	playing,
	paused,
	ended
}

tracks=[snd_backingTrack1];

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

songs=[
{
	name:"Test Song",
	description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
	instruments:["merwas","hawan","tabel","yahala","tar","hands"],
	difficulty:3,
	tracks:[snd_backingTrack1,snd_backingTrack2,snd_backingTrack1,snd_backingTrack2,snd_backingTrack1,snd_backingTrack2],
	midiMap:"music3.txt",
	bpm:166
},
{
	name:"Sawt Arabi",
	description:"Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
	instruments:["hands","merwas"],
	difficulty:1,
	tracks:[snd_sawtArabi_claps1,snd_sawtArabi_merwas],
	midiMap:"sawtArabi1.txt",
	bpm:124
}
]

midiMap=ds_map_create();
for(var i=0;i<array_length(songs);i++){
	var t=songs[i].midiMap;
	midiMap[?t]=ParseMidi(t,songs[i]);
	
}
midiTracks=-1;


instrumentMap=ds_map_create();
instrumentMap[?"merwas"]=1;
instrumentMap[?"hawan"]=2;
instrumentMap[?"tabel"]=3;
instrumentMap[?"yahala"]=4;
instrumentMap[?"tar"]=5;
instrumentMap[?"hands"]=6;

startStages=["song","instrument","difficulty"];	//stages of options to go through at the start
startStage=0;		//current stage of options
lastStartStage=0;
songIndex=0;