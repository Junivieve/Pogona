var _targetAngle = 0;
var _stiff = 1/80;
var _damp = 1/20;
var _displace = (_targetAngle-image_angle);
swaySpeed += (_stiff * _displace);
swaySpeed -= (_damp * swaySpeed);
image_angle += swaySpeed;

// simulate wind
var _windDir = -1;
var _gustInt = 150;
if((x+timer) mod _gustInt == 0) {
	var _rand = random_range(-swapAmp, swapAmp);
	swaySpeed += _windDir + _rand;
}

timer ++;

var _actor = instance_place(x, y, oPogo);
if(_actor != noone) {
	if(_actor.hspd != 0) {
		swaySpeed = -_actor.hspd * hitAmp;	
	}
}