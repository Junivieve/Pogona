spd = lerp(spd, 0.45, 0.1);
x = lerp(x, oPogo.x, spd);
y = lerp(y, oPogo.y, spd);
CreateParticle(x, y, "Instances", OBJ_PARTICLE, sSparkticle, irandom(360), 0.2, 3, 1, c_white, true);
if(place_meeting(x, y, oPogo)) {
	oPogo.scales ++;
	
	randomize();
	audio_play_sound(choose(mItemRecieved1, mItemRecieved2), 1, false);
	instance_destroy();	
}
var _s = oPogo.scales-1 <= 0 ? 0 : 1;
oController.scales[_s].setImageAlpha(1);