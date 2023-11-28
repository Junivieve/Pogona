/// @description boing
image_speed = 1;
	other.hspd=lengthdir_x(4.6,image_angle+90)
	other.vspd=lengthdir_y(4.6,image_angle+90)
	if other.vspd=0{other.vspd=-5}
	
	
	with(other){
		ignoreInputTimer=5 
		stateSet(STATE_JUMP)
		resetStats()
	}
	
