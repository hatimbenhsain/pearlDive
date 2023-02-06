/// @description Insert description here
// You can write your code in this editor
var c1=make_color_rgb(51,51,51)
var c2=make_color_rgb(20,20,20)
draw_rectangle_color(0,0,room_width,room_height,c1,c1,c1,c1,false)
var tk=gameManager.timeKeeper

//shader_set(shaderBloomLum);
//shader_set_uniform_f(ubloomRange,bloomRange);
//shader_set_uniform_f(ubloomTreshold,bloomTreshold);

draw_sprite(spr_diwaniya,0,diwaniyaX,diwaniyaY);

if(gameManager.currentState==states.start || gameManager.currentState==states.ended){
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

if(tk.playing){
	
	//draw_sprite(spr_musician3,0,diwaniyaX-12,diwaniyaY-12);
	//draw_sprite(spr_musician4,0,diwaniyaX+32,diwaniyaY-5);
	//draw_sprite(spr_musician2,0,diwaniyaX-33,diwaniyaY-4);
	//draw_sprite(spr_musician1,0,diwaniyaX-53,diwaniyaY+6);

	
	var drawMusician=function(m,i){
		var ins=gameManager.songs[gameManager.songIndex].instruments;
		for(var k=0;k<array_length(ins);k++){
			if(i+1==gameManager.instrumentMap[?ins[k]]){
				draw_sprite(m.spr,m.image,diwaniyaX+m.x,diwaniyaY+m.y);
				break;
			}
		}
	}
	
	array_foreach(gameManager.musicians,drawMusician);

	if(spotlight){
		draw_sprite_ext(spr_spotlight,spotlightIndex,0,0,image_xscale,image_yscale,0,c_white,spotlightAlpha);
	}

}

