aliveTime -= 0.01 * global.gameTime;

if(aliveTime <= 0) {
	instance_create_layer(x, y, "Instances", oScaleItem);
	instance_destroy();	
}