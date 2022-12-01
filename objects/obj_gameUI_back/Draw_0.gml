/// @description Insert description here
// You can write your code in this editor
var c1=make_color_rgb(51,51,51)
var c2=make_color_rgb(20,20,20)
draw_rectangle_color(0,0,room_width,room_height,c1,c1,c1,c1,false)
var tk=gameManager.timeKeeper

draw_sprite(spr_diwaniya,0,222,111);

if(gameManager.currentState==states.start || gameManager.currentState==states.ended){
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

if(tk.playing){
	
	draw_sprite(spr_musician3,0,210,99);
	draw_sprite(spr_musician4,0,254,106);
	draw_sprite(spr_musician2,0,189,107);
	draw_sprite(spr_musician1,0,169,117);
	
	draw_sprite(spr_grey,0,0,0);
	draw_rectangle_color(79,0,80,127,c2,c2,c2,c2,false)
	draw_rectangle_color(79,160,80,room_height,c2,c2,c2,c2,false)
	draw_rectangle_color(92,134,room_width,135,c2,c2,c2,c2,false)
	draw_rectangle_color(97,152,room_width,153,c2,c2,c2,c2,false)
	if(tk.playing){
		for(var t=tk.lastBeat+tk.crochet;t<tk.lastBeat+tk.crochet+10;t+=tk.crochet){
			var xx=80+gameManager.pixelsPerSec*(t-tk.songPosition);	
			draw_sprite(spr_beat,0,xx,144);
		}
	}
	draw_sprite(spr_basket_inside,0,80,144);

}