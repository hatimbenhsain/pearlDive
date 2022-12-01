/// @description Insert description here
// You can write your code in this editor

//draw_sprite(spr_bar,0,0,0);
var tk=gameManager.timeKeeper



if(tk.playing){
	draw_sprite(spr_basket_outside,0,80,144);
	draw_sprite(asset_get_index("spr_instrument"+string(gameManager.currentInstrument)),0,34,144);
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
			draw_sprite(gameManager.clapSprites[i],s,xx,room_height-15);
		}
	}
}