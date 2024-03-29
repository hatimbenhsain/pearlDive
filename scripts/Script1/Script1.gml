// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckCollisionPoint(xx,yy,sx,sy,w,h){
	if(xx>=sx-w/2 && xx<=sx+w/2 && yy>=sy-h/2 && yy<=sy+h/2){
		return true;	
	}else{
		return false;	
	}
}

function Start(){
	with(obj_gameManager){
		currentScore=0;
		detailScores={
			perfect:0,
			great:0,
			good:0,
			miss:0
		}
		currentState=states.playing;
		tracks=songs[songIndex].tracks;
		timeKeeper.audios=[];

		// find track to not play (same as current instrument)
		currentInstrumentObj=asset_get_index("obj_instrument"+string(currentInstrument));
		var k=array_get_index(songs[songIndex].instruments,string_lower(currentInstrumentObj.name));
		var trackToExclude=songs[songIndex].tracks[k];
		
		for(var i=0;i<array_length(tracks);i++){
			if(tracks[i]!=trackToExclude && array_get_index(timeKeeper.audios,tracks[i])==-1){
				array_push(timeKeeper.audios,tracks[i]);
			}
		}
		
		with(obj_note){
			instance_destroy(self);	
		}
		midiTracks=midiMap[?songs[songIndex].midiMap];
		GenerateNotes();
		
		timeKeeper.bpm=songs[songIndex].bpm;
		timeKeeper.crochet=60/timeKeeper.bpm;
		
		array_foreach(musicians,function(m,i){
			m.noteIndex=0;	
		});

	}
	with(obj_timeKeeper){
		
		playing=true;
		for(var i=0;i<array_length(audios);i++){
			audio_stop_sound(audios[i]);
			tracks[i]=audio_play_sound(audios[i],1,false);	
		}
		lastBeat=0;
	}
	with(obj_gameUI_back){
		spotlightIndex=gameManager.currentInstrument-1;
	}
	with(obj_difficultyScreen){
		active=false;	
	}
}

function Stop(){
	with(obj_gameManager){
		currentState=states.ended;	
	}
	with(obj_timeKeeper){
		for(var i=0;i<array_length(tracks);i++){
			audio_stop_sound(tracks[i]);
		}
		lastBeat=0;
		playing=false;
		ResetNotes();
	}

}

function PauseMusic(){
	with(obj_timeKeeper){
		for(var i=0;i<array_length(tracks);i++){
			audio_pause_sound(tracks[i]);
		}
		playing=false;
	}
}

function ResumeMusic(){
	with(obj_timeKeeper){
		for(var i=0;i<array_length(tracks);i++){
			audio_resume_sound(tracks[i]);
		}
		playing=true;	
	}
}

function Retry(){
	with(obj_settings){
		active=false;	
	}
	Stop();
	Start();
}

function GenerateNotes(){
	with(obj_gameManager){
		ds_list_destroy(notes);
		notes=ds_list_create();
		//for(var i=0;i<200;i++){
		//	var n=instance_create_depth(0,0,depth,obj_note);
		//	n.button=floor(random_range(0,2));
		//	n.time=i*60/120;
		//	n.scored=false;
		//	ds_list_add(notes,n);
		//}
		var t=midiTracks[(currentInstrument-1)%array_length(midiTracks)];
		for(var i=0;i<array_length(t);i++){
			var n=t[i];
			var note=instance_create_depth(0,0,depth-1,obj_note);
			note.time=n.time;
			if(n.midi==36){
				note.button=0;	
			}else{
				note.button=1;	
			}
			note.dumSample=currentInstrumentObj.dumSample;
			note.takSample=currentInstrumentObj.takSample;
			ds_list_add(notes,note);
		}
		noteIndex=0;
		nextNote=notes[|noteIndex];
	}
}

function ResetNotes(){
	with(obj_gameManager){
		for(var i=ds_list_size(notes);i>=0;i--){
			with(notes[|i]){
				instance_destroy(self);	
			}
			ds_list_delete(notes,i);		
		}
	}
}

function ParseMidi(fileName,song=-1){
	//var arr=OpenFile(fileName);
	//var map=json_decode(json_stringify(arr));
	//map=map[?"default"]
	//var tracks=map[?"tracks"];
	//var track=tracks[|0];
	//var midiNotes=track[?"notes"];
	//return midiNotes;
	var json=OpenJson(fileName);
	var tracks=json.tracks;
	var midiTracks=[];
	for(var i=0;i<array_length(tracks);i++){
		var track=tracks[i];
		//if(array_length(track.notes)>0){
		array_push(midiTracks,track.notes);
		//}
	}
	//var midiNotes=track.notes;
	
	var header=json.header;
	var tempos=json.tempo;
	var tempo=tempos[0];
	var bpm=tempo.bpm;
	
	obj_timeKeeper.bpm=bpm;
	obj_timeKeeper.crochet=60/bpm;
	
	if(song!=-1){
		song.bpm=bpm;
		song.crochet=60/bpm;
	}
	
	return midiTracks;
}

function OpenFile(dir){
	var i, file, array;
	file = file_text_open_read(dir);
	i=0;
	if (file == -1) {
		return -1;
	}
	while (!file_text_eof(file)) {
		array[i] = file_text_readln(file);
		i++;
	}
	file_text_close(file);
	return array;
}

function OpenJson(dir){
	var _buff = buffer_load(dir);
	var _out = buffer_read(_buff, buffer_string);
	buffer_delete(_buff);
	return json_parse(_out);
}

function SetShaders(){
	upixelH=shader_get_uniform(sh_whiteOutline,"pixelH");
	upixelW=shader_get_uniform(sh_whiteOutline,"pixelW");
	texelW=texture_get_texel_width(sprite_get_texture(sprite_index,0));
	texelH=texture_get_texel_height(sprite_get_texture(sprite_index,0));
}

function ChangeState(s){
	with(obj_gameManager){
		var prev=currentState;
		currentState=s;	
		ResetAnimations(prev);
		switch(currentState){
			case states.start:
				
				break;
			case states.playing:
				Start();
				break;
			case states.ended:
				Stop();
				break;
		}
	}
}

function ResetAnimations(prev){
	with(obj_gameManager){
		switch(currentState){
			case states.start:
			
				break;
			case states.playing:
				
				break;
		}
	}
}
