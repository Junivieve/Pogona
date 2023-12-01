aliveTime -= 0.02 * global.gameTime;

if(aliveTime <= 0) {
	with(oScalePlatform) {
		instance_create_layer(x, y, "Instances", oScaleItem);
		instance_destroy();	
	}
}