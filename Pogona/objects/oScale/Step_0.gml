x += spd * dir;
image_xscale = dir;
if(instance_exists(oScalePlatform)) {
	if(point_distance(x, y, oScalePlatform.x, oScalePlatform.y) < 3) {
		instance_create_layer(x, y, "Instances", oScaleItem);
		instance_destroy();	
		audio_play_sound(mScaleBreak, 1, false);
	}
}
if(place_meeting(x, y, oTrap)) {
	instance_create_layer(x, y, "Instances", oScaleItem);
	instance_destroy();	
	audio_play_sound(mScaleBreak, 1, false);
}
if(place_meeting(x, y, oFrog)) {
	var _f = instance_place(x, y, oFrog);
	_f.hp --;
	_f.state = FROGSTATE.HURT;
	instance_create_layer(x, y, "Instances", oScaleItem);
	instance_destroy();	
	audio_play_sound(mScaleBreak, 1, false);
}
if(place_meeting(x, y, oSuperFrog)) {
	var _f = instance_place(x, y, oSuperFrog);
	_f.hp --;
	_f.state = BIGFROGSTATE.HURT;
	instance_create_layer(x, y, "Instances", oScaleItem);
	instance_destroy();	
	audio_play_sound(mScaleBreak, 1, false);
}
if(place_meeting(x+dir, y, oBox)) {
	var _box = instance_place(x+dir, y, oBox);
	var _sp = dir == -1 ? 14 : -16;
	var _p = instance_create_layer(_box.x + _sp, y, "Instances", oScalePlatformSpawn);
	_p.image_xscale = dir;
	audio_play_sound(mScaleHitWall, 1, false);
	instance_destroy();	
}