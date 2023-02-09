/// @description Insert description here
// You can write your code in this editor

var stage=gameManager.startStages[gameManager.startStage];

if(gameManager.currentState==states.start  && gameManager.startStage<array_length(gameManager.startStages)-1
&& (stage!="instrument" || gameManager.currentInstrument!=-1) && !gameManager.info.active){
	active=true;	
}else{
	active=false;	
}

if(active && selected){
	gameManager.startStage+=1;
}


// Inherit the parent event
event_inherited();

