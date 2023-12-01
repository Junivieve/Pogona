/// @description boing
if(!audio_is_playing(mb_1) && !audio_is_playing(mb_2)
&& !audio_is_playing(mb_3) && !audio_is_playing(mb_4)) {
	audio_play_sound(choose(mb_1, mb_2, mb_3, mb_4), 1, false);	
}
image_speed = 1;
	other.hspd=lengthdir_x(4.6,image_angle+90)
	other.vspd=lengthdir_y(4.6,image_angle+90)
	if other.vspd=0{other.vspd=-5}
	
	
	with(other){
		ignoreInputTimer=5 
		stateSet(STATE_JUMP)
		resetStats()
	}
	
