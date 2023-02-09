/// @description Insert description here
// You can write your code in this editor

var tk=gameManager.timeKeeper;
var sc=gameManager.screenScale;

if(tk.playing){
	draw_sprite_ext(spr_basket_outside,0,notesX*sc,notesY*sc,sc,sc,0,c_white,1);
	var instrument=asset_get_index("obj_instrument"+string(gameManager.currentInstrument));
	draw_sprite_ext(instrument.sprite_index,0,(notesX-46)*sc,notesY*sc,
	instrumScale*sc,instrumScale*sc,0,c_white,1);
	draw_set_color(c_black);
	draw_set_color(c_white);
	
	if(gameManager.claps){
		var l=array_length(gameManager.clapSprites)
		var s=1;
		if((tk.lastBeat/tk.crochet)%tk.crochetsPerBar==0){
			s=0;
		}
		for(var i=0;i<l;i++){
			var xx=(i+0.5)*35+room_width/2-l*35/2
			draw_sprite_ext(gameManager.clapSprites[i],s,xx*sc,(room_height-15)*sc,sc,sc,0,c_white,1);
		}
	}
}

if(gameManager.currentState==states.playing){
	draw_set_font(font_pixellariMedium);
	draw_set_halign(fa_left);
	draw_text(sc*5,sc*5,tk.songPosition);
	draw_set_halign(fa_right);
	draw_text(sc*(room_width-5),sc*5,gameManager.currentScore);
	if(gameManager.scoreToAdd>0){
		var alpha=animcurve_channel_evaluate(channel2,gameManager.lastScoreTime/
		gameManager.lastScoreLength);
		draw_set_alpha(alpha);
		draw_text(sc*(room_width-5),sc*15,"+"+string(gameManager.scoreToAdd));
		draw_set_alpha(c_white);
	}
	// drawing number countdown at the start
	//if(tk.lastBeat/(tk.crochet*tk.crochetsPerBar)<5 && tk.lastBeat/(tk.crochet*tk.crochetsPerBar)>=1){
	//	draw_set_font(font_pixellariBiggest)
	//	draw_set_halign(fa_center);
	//	draw_set_valign(fa_center);
	//	draw_text(sc*room_width/2,sc*room_height/2,floor(tk.lastBeat/(tk.crochet*tk.crochetsPerBar)));
	//}
}else if(gameManager.currentState==states.ended){
	draw_set_font(font_pixellariBig);
	draw_set_halign(fa_center);
	draw_text(sc*room_width/2,sc*(room_height/2-35),"score:");
	draw_text(sc*(room_width/2),sc*room_height/2,gameManager.currentScore);
	draw_set_font(font_pixellariSmall)
	draw_set_halign(fa_right);
	draw_text(sc*(room_width-26),sc*(room_height-15),"perfect :");
	draw_text(sc*(room_width-26),sc*(room_height-25),"great :");
	draw_text(sc*(room_width-26),sc*(room_height-35),"good :");
	draw_text(sc*(room_width-26),sc*(room_height-45),"missed :");
	draw_set_halign(fa_left);
	draw_text(sc*(room_width-20),sc*(room_height-15),string(gameManager.detailScores.perfect));
	draw_text(sc*(room_width-20),sc*(room_height-25),string(gameManager.detailScores.great));
	draw_text(sc*(room_width-20),sc*(room_height-35),string(gameManager.detailScores.good));
	draw_text(sc*(room_width-20),sc*(room_height-45),string(gameManager.detailScores.miss));	
}else if(gameManager.currentState=states.start){
	draw_set_font(font_pixellariBig);
	draw_set_halign(fa_center);
	if(!gameManager.info.active){
		switch(gameManager.startStages[gameManager.startStage]){
			case "song":
				var song=gameManager.songs[gameManager.songIndex];
				draw_text(sc*room_width/2,30,"Choose a song:");
				draw_set_color(c_white);
				draw_set_halign(fa_left);
				draw_text_ext(sc*(room_width-200)/2,sc*50,song.name,sc*5,sc*200);
				for(var i=0;i<3;i++){
					var image=1;
					if(song.difficulty<=i) image=0;
					draw_sprite_ext(spr_star,image,sc*(room_width/2+100-(3-i)*18),sc*55,sc,sc,0,c_white,image_alpha);
				}
				for(var i=0;i<array_length(song.instruments);i++){
					spr=asset_get_index("spr_instrument"+string(gameManager.instrumentMap[?song.instruments[i]]));	
					var xx=20*(i+0.5-array_length(song.instruments)/2)+room_width/2;
					var xx=room_width/2+100-(array_length(song.instruments)-i)*20;
					draw_sprite_ext(spr,0,xx*sc,sc*(room_height-30),sc/3,sc/3,0,c_white,image_alpha);
				}
				draw_set_font(font_pixellariMedium);
				draw_text_ext(sc*(room_width/2-100),sc*75,song.description,sc*15,sc*200);
				draw_set_halign(fa_right);
				draw_text(sc*(room_width-10),sc*10,
				"("+string(gameManager.songIndex+1)+"/"+string(array_length(gameManager.songs))+")");
				break;
			case "instrument":
				draw_text(sc*room_width/2,30,"Choose an instrument:");
				break;
			case "difficulty":
				draw_text(sc*room_width/2,30,"Choose your difficulty setting:");
				draw_set_halign(fa_right);
				draw_text(sc*(room_width/2-125),sc*93,"Easy");
				draw_set_halign(fa_left);
				draw_text(sc*(room_width/2+125),sc*93,"Hard");
				break;
		}
	}
}

