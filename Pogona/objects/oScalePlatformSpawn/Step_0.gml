if(image_index >= image_number-1) {
	instance_create_layer(x, y, "Instances", oScalePlatform);
	instance_destroy();
}