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

retryButtonX=room_width/2;
retryButtonY=room_height*3/4;
retryButtonW=80;
retryButtonH=35;

prevActive=active //active before the beginning of frame?

mouseOffsetX=0;		//mouse x offset from currently dragged element

retryButtonActive=false;	

//x=diffSliderX+diffSliderLength*(diffSliderPosition-1/2);
//y=diffSliderY;

