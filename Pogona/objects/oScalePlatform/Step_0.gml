aliveTime -= 0.02 * global.gameTime;

if(aliveTime <= 0) {
	with(oScalePlatform) {
		instance_create_layer(x, y, "Instances", oScaleItem);
		instance_destroy();	
	}
}

if (instance_exists(oScalePlatform)) {
    var minDistance = 16; // Set your desired distance here
    var closestInstance = noone;

    // Iterate through all instances of oScalePlatform
    with (oScalePlatform) {
        if (id != other.id) {
            var currentDistance = point_distance(x, y, other.x, other.y);

            // Check if the distance is less than the minimum
            if (currentDistance < minDistance) {
                minDistance = currentDistance;
                closestInstance = other.id;
            }
        }
    }

    // Check if there is a close instance and create a new one
    if (closestInstance != noone) {
        instance_create_layer(x, y, "Instances", oScaleItem);
        instance_destroy();
        audio_play_sound(mScaleBreak, 1, false);
    }
}