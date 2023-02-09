/// @description Insert description here
// You can write your code in this editor


if(gameManager.currentState==states.start && gameManager.startStage=array_length(gameManager.startStages)-1
&& gameManager.info.active==false){
	active=true;	
}else{
	active=false;	
}

if(active && selected && gameManager.currentInstrument!=-1){
	ChangeState(states.playing);
}


// Inherit the parent event
event_inherited();

