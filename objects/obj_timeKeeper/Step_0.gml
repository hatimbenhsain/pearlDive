/// @description Insert description here
// You can write your code in this editor


songPosition=audio_sound_get_track_position(track);

if(playing){
	if(songPosition>lastBeat+crochet){
		lastBeat=lastBeat+crochet;
	}
}