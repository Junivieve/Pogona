x += spd * dir;
image_xscale = dir;
if(instance_exists(oScalePlatform)) {
	if(point_distance(x, y, oScalePlatform.x, oScalePlatform.y) < 3) {
		instance_create_layer(x, y, "Instances", oScaleItem);
		instance_destroy();	
		audio_play_sound(mScaleBreak, 1, false);
	}
}
if(place_meeting(x, y, oBox)) {
	var _p = instance_create_layer(x-11*dir, y, "Instances", oScalePlatform);
	_p.image_xscale = dir;
	audio_play_sound(mScaleHitWall, 1, false);
	instance_destroy();	
}