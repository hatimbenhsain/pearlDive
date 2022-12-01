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
		currentState=states.playing;	
	}
	with(obj_timeKeeper){
		GenerateNotes();
		playing=true;
		audio_stop_sound(snd_claps);
		track=audio_play_sound(snd_claps,1,false);	
	}
}

function Stop(){
	with(obj_gameManager){
		currentState=states.ended;	
	}
	with(obj_timeKeeper){
		audio_stop_sound(track);
		lastBeat=0;
		playing=false;
		ResetNotes();
	}
	with(obj_gameManager){
		currentScore=0;	
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
		for(var i=0;i<array_length(midiNotes);i++){
			var n=midiNotes[i];
			var note=instance_create_depth(0,0,depth-1,obj_note);
			note.time=n.time;
			if(n.midi==36){
				note.button=0;	
			}else{
				note.button=1;	
			}
			show_debug_message(note.time);
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

function ParseMidi(fileName){
	//var arr=OpenFile(fileName);
	//var map=json_decode(json_stringify(arr));
	//map=map[?"default"]
	//var tracks=map[?"tracks"];
	//var track=tracks[|0];
	//var midiNotes=track[?"notes"];
	//return midiNotes;
	var json=OpenJson(fileName);
	var tracks=json.tracks;
	var track=tracks[0];
	var midiNotes=track.notes;
	
	var header=json.header;
	var tempos=header.tempos;
	var tempo=tempos[0];
	var bpm=tempo.bpm
	obj_timeKeeper.bpm=bpm;
	obj_timeKeeper.crochet=60/bpm
	
	return midiNotes;
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