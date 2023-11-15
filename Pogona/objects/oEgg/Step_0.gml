image_alpha -= 0.01 * global.gameTime;

if(image_alpha <= 0) {
	instance_destroy();
}	
	