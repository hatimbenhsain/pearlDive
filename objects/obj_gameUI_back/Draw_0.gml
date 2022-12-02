/// @description Insert description here
// You can write your code in this editor
var c1=make_color_rgb(51,51,51)
var c2=make_color_rgb(20,20,20)
draw_rectangle_color(0,0,room_width,room_height,c1,c1,c1,c1,false)
var tk=gameManager.timeKeeper

draw_sprite(spr_diwaniya,0,diwaniyaX,diwaniyaY);

if(gameManager.currentState==states.start || gameManager.currentState==states.ended){
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

if(tk.playing){
	
	draw_sprite(spr_musician3,0,diwaniyaX-12,diwaniyaY-12);
	draw_sprite(spr_musician4,0,diwaniyaX+32,diwaniyaY-5);
	draw_sprite(spr_musician2,0,diwaniyaX-33,diwaniyaY-4);
	draw_sprite(spr_musician1,0,diwaniyaX-53,diwaniyaY+6);
	
	//draw_sprite(spr_grey,0,0,0);
	draw_sprite(spr_sideBar,0,notesX,notesY);
	draw_sprite(spr_musicBar,0,notesX,notesY);
	draw_rectangle_color(notesX-1,0,notesX,notesY-17,c2,c2,c2,c2,false)
	draw_rectangle_color(notesX-1,notesY+14,notesX,room_height,c2,c2,c2,c2,false)
	draw_rectangle_color(notesX+12,notesY-10,room_width,notesY-9,c2,c2,c2,c2,false)
	draw_rectangle_color(notesX+12,notesY+8,room_width,notesY+9,c2,c2,c2,c2,false)
	if(tk.playing){
		for(var t=tk.lastBeat+tk.crochet;t<tk.lastBeat+tk.crochet+10;t+=tk.crochet){
			var xx=notesX+gameManager.pixelsPerSec*(t-tk.songPosition);	
			draw_sprite(spr_beat,0,xx,notesY);
		}
	}
	draw_sprite(spr_basket_inside,0,notesX,notesY);

}