/// @description Insert description here
// You can write your code in this editor


songPosition=audio_sound_get_track_position(track);

if(playing){
	if(songPosition>lastBeat+crochet){
		lastBeat=lastBeat+crochet;
	}
}
//		if(keyboard_check_pressed(ord("X"))){
//			clicked=true;	
//		}
//		if(clicked)	subimg=2;
//	}else if(songPosition>lastBeat && songPosition<=lastBeat+animLength){
//		if(keyboard_check_pressed(ord("X"))){
//			clicked=true;	
//		}
//		if(clicked)	subimg=2;
//	}else{
//		clicked=false;	

//}else subimg=0;