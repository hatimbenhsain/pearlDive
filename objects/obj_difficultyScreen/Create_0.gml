/// @description Insert description here
// You can write your code in this editor
active=false;

diffSliderPosition=obj_gameManager.difficultyLevel/(array_length(obj_tuner.timeWindows)-1);	//difficulty slider settings
diffSliderX=room_width/2;
diffSliderY=room_height/2;
diffSliderLength=200;
diffSliderThickness=5;
diffSliderDragged=false; //is the difficulty slider being dragged right now?
diffX=diffSliderX+diffSliderLength*(diffSliderPosition-1/2);	//where is the button x
prevDiffLevel=obj_gameManager.difficultyLevel;	//difficulty level before the beginning of frame


prevActive=active //active before the beginning of frame?

mouseOffsetX=0;		//mouse x offset from currently dragged element

gameManager=instance_find(obj_gameManager,0)

