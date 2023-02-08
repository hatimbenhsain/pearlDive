
if(prevActive!=active && active=false){
	with(obj_button_settings){
		active=false;	
	}
}else if(prevActive!=active && active){
	var d=depth;
	with(obj_button_settings){
		active=true;
		depth=d-1;
	}
}

if(active){

}

prevActive=active;