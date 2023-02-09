/// @description Insert description here
// You can write your code in this editor

var c1=make_color_rgb(51,51,51)
var c2=make_color_rgb(20,20,20)
var tk=gameManager.timeKeeper;
var sc=gameManager.screenScale;


if(tk.playing){
	//draw_sprite(spr_grey,0,0,0);
	draw_sprite_ext(spr_sideBar,0,notesX*sc,notesY*sc,sc,sc,0,c_white,1);
	draw_sprite_ext(spr_musicBar,0,notesX*sc,notesY*sc,sc,sc,0,c_white,1);
	draw_rectangle_color((notesX-1)*sc,0*sc,notesX*sc,(notesY-17)*sc,c2,c2,c2,c2,false)
	draw_rectangle_color((notesX-1)*sc,(notesY+14)*sc,(notesX)*sc,room_height*sc,c2,c2,c2,c2,false)
	draw_rectangle_color((notesX+12)*sc,(notesY-10)*sc,room_width*sc,(notesY-9)*sc,c2,c2,c2,c2,false)
	draw_rectangle_color((notesX+12)*sc,(notesY+8)*sc,room_width*sc,(notesY+9)*sc,c2,c2,c2,c2,false)
	if(tk.playing){
		for(var t=tk.lastBeat+tk.crochet;t<tk.lastBeat+tk.crochet+10;t+=tk.crochet){
			var xx=notesX+gameManager.pixelsPerSec*(t-tk.songPosition);	
			draw_sprite_ext(spr_beat,0,xx*sc,notesY*sc,sc,sc,0,c_white,1);
		}
	}
	draw_sprite_ext(spr_basket_inside,0,notesX*sc,notesY*sc,sc,sc,0,c_white,1);
	if(songlengthBar){
		draw_set_color(c_gray);
		var x2=guiW*gameManager.timeKeeper.songPosition/gameManager.timeKeeper.songLength;
		draw_rectangle(0,guiH-sc*5,x2,guiH,false);
		draw_set_color(c_white);
	}
}
