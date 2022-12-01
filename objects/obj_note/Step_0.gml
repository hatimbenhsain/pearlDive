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
	x=80+pixelsPerSec*(time-timeKeeper.songPosition);	
}
if(scoredPrev!=scored){
	alarm[0]=room_speed*0.3
	if(button=0){
		audio_play_sound(snd_drum1,1,false);
	}else{
		audio_play_sound(snd_drum2,1,false);
	}
}

if(scoredPrev){
	image_alpha-=delta_time/(1000000*0.3);
}

scoredPrev=scored;