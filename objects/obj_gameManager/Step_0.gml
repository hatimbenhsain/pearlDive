/// @description Insert description here
// You can write your code in this editor

// Add the score
if(scoreToAdd!=0){
	lastScoreTime+=delta_time/1000000
	if(currentState!=states.playing || lastScoreTime>=lastScoreLength){
		currentScore+=scoreToAdd;
		scoreToAdd=0;
	}
}

// Find timekeeper 
if(timeKeeper==noone){
	timeKeeper=instance_find(obj_timeKeeper,0);
	uiFront.timeKeeper=timeKeeper;
	uiBack.timeKeeper=timeKeeper;
}
// Find settings
if(settings==noone){
	settings=instance_find(obj_settings,0);
}

if(!settings.active){
	with(timeKeeper){
		if(!playing && keyboard_check_pressed(vk_space) && obj_gameManager.currentInstrument!=-1){
			ChangeState(states.playing);
		}else if(playing && keyboard_check_pressed(vk_space)){
			ChangeState(states.ended);
		}else if(playing){
			if(!audio_is_playing(song)){
				ChangeState(states.ended);
			}
		}
	}
}

if(timeKeeper.playing && !settings.active){
	
	//update musicians
	array_foreach(musicians,function(m,i){
		m.time+=delta_time/1000000;
		if(m.time>=0.15){
			m.image=0;	
		}
		//if(i!=currentInstrument-1){
		//	if(m.noteIndex+1<array_length(midiTracks[i])){
		//		var nextNote=midiTracks[i][m.noteIndex];
		//		if(timeKeeper.songPosition>nextNote.time){
		//			m.time=0;
		//			m.image=1+(m.lastImg%(sprite_get_number(m.spr)-1));
		//			m.lastImg=m.image;
		//			m.noteIndex++;
		//		}
		//	}
		//}
	})
	
	if(cooldown>0){
		cooldown-=timeKeeper.songPosition-lastSongPosition;	
		cooldown=clamp(cooldown,0,penaltyTime);
	}
	
	if(noteIndex+1<ds_list_size(notes) && (nextNote.scored || 
	timeKeeper.songPosition>nextNote.time+timeWindows[difficultyLevel]
	[array_length(timeWindows[difficultyLevel])-1]/2)){
		noteIndex++;
		nextNote=notes[|noteIndex];
		show_debug_message(noteIndex);
	}else if(noteIndex+1>=ds_list_size(notes) && nextNote!=-1 && nextNote.scored){
		nextNote=-1;	
	}
	
	
	if(nextNote!=-1 && !nextNote.scored && (keyboard_check_pressed(buttons1[nextNote.button]) ||
	mouse_check_button_pressed(buttons2[nextNote.button]))){
		var scored=false;
		if(cooldown<=0){
			for(var i=0;i<array_length(timeWindows[difficultyLevel]);i++){
				if(timeKeeper.songPosition>nextNote.time-timeWindows[difficultyLevel][i]/2 && 
				timeKeeper.songPosition<nextNote.time+timeWindows[difficultyLevel][i]/2){
					currentScore+=scoreToAdd;
					scoreToAdd=scores[i];
					lastScoreTime=0;
					nextNote.scored=true;
					nextNote.scoreValue=i;
					//var scoreUI=instance_create_depth(0,0,depth,obj_scoreUI);
					//scoreUI.subimg=i;
					scored=true
					break;
				}
			}
			obj_gameUI_front.animTime=0;
			
			//Update player musician
			var m=musicians[currentInstrument-1];
			m.time=0;
			m.image=1+(m.lastImg%(sprite_get_number(m.spr)-1));
			m.lastImg=m.image;
			
		}
		if(!scored){
			cooldown=penaltyTime;
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
