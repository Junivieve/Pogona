time -= 0.01 * ((60/1000000) * delta_time);
if(instance_exists(oPlayer)) {
	if(oPlayer.y > y+1 || (keyboard_check(vk_down))) {
		mask_index = -1;	
	} else {
		mask_index = sScalePlatform;	
	}
	
	if(time <= 0) {
		instance_create_layer(x, y+2, "Instances", oScaleItem);
		instance_destroy();
	}
}