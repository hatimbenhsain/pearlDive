/// @description Insert description here
// You can write your code in this editor
image_index=button;

if(!spriteSet){
	if(button==0){
		sprite_index=spr_pearl_white;	
	}else{
		sprite_index=spr_pearl_black;	
	}
	spriteSet=true;
}
if(timeKeeper.playing && !scoredPrev){
	x=notesX+pixelsPerSec*(time-timeKeeper.songPosition);	
}
if(scoredPrev!=scored){
	alarm[0]=room_speed*disappearingTime;
	if(button=0){
		audio_play_sound(snd_drum1,1,false);
	}else{
		audio_play_sound(snd_drum2,1,false);
	}
	targetx=room_width-24;
	targety=24;
	startx=x;
	starty=y;
	animationTime=0;
}

if(scoredPrev){
	animationTime+=delta_time/1000000;
	image_alpha=1-animcurve_channel_evaluate(channel3,(animationTime/animationLength));
	show_debug_message(image_alpha);
	x=startx+(targetx-startx)*animationTime/animationLength;
	//x=startx+(targetx-startx)*animcurve_channel_evaluate(channel4,animationTime/animationLength);
	y=starty+(targety-starty)*animcurve_channel_evaluate(channel2,(animationTime/animationLength));
}

scoredPrev=scored;