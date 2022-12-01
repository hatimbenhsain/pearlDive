/// @description Insert description here
// You can write your code in this editor
if(timeKeeper==noone){
	timeKeeper=instance_find(obj_timeKeeper,0);
	uiFront.timeKeeper=timeKeeper;
	uiBack.timeKeeper=timeKeeper;
}
if(settings==noone){
	settings=instance_find(obj_settings,0);
}

if(!settings.active){
	with(timeKeeper){
		if(!playing && keyboard_check_pressed(vk_space) && obj_gameManager.currentInstrument!=-1){
			Start()
		}else if(playing && keyboard_check_pressed(vk_space)){
			Stop()
		}else if(playing){
			if(!audio_is_playing(snd_claps)){
				Stop();
			}
		}
	}
}

if(timeKeeper.playing && !settings.active){
	if(cooldown>0){
		cooldown-=timeKeeper.songPosition-lastSongPosition;	
		cooldown=clamp(cooldown,0,penaltyTime);
	}
	
	if(noteIndex+1<ds_list_size(notes) && (nextNote.scored || 
	timeKeeper.songPosition>nextNote.time+timeWindows[difficultyLevel]
	[array_length(timeWindows[difficultyLevel])-1]/2)){
		noteIndex++;
		nextNote=notes[|noteIndex];
	}
	
	
	if(!nextNote.scored && (keyboard_check_pressed(buttons1[nextNote.button]) ||
	mouse_check_button_pressed(buttons2[nextNote.button]))){
		var scored=false;
		if(cooldown<=0){
			for(var i=0;i<array_length(timeWindows[difficultyLevel]);i++){
				if(timeKeeper.songPosition>nextNote.time-timeWindows[difficultyLevel][i]/2 && 
				timeKeeper.songPosition<nextNote.time+timeWindows[difficultyLevel][i]/2){
					currentScore+=scores[i];
					nextNote.scored=true;
					var scoreUI=instance_create_depth(0,0,depth,obj_scoreUI);
					scoreUI.subimg=i;
					scored=true
					break;
				}
			}
		}
		if(!scored){
			cooldown=penaltyTime;
			show_debug_message("cooldown");
		}
		lastClick=timeKeeper.songPosition;
	}
	
	lastSongPosition=obj_timeKeeper.songPosition;
}

if(keyboard_check_pressed(vk_escape)){
	settings.active=!settings.active;
	if(settings.active){
		show_debug_message("pause");
		with(timeKeeper){
			audio_pause_sound(track);
			playing=false;
		}
	}else{
		audio_resume_sound(timeKeeper.track);	
		timeKeeper.playing=true;
	}
}

