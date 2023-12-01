oPogo.hasShoot = true;
oPogo.scales ++;
audio_play_sound(mcollectable, 1, false);
array_push(oController.scales, heartsPanel.add(new UISprite("ScaleImage"+string(i), 9 + (16 * array_length(oController.scales)-1), 18, sScaleUI))); 
screenshake(3, 12, 0.2);
repeat(6) {
	CreateParticle(x, y, "Instances", OBJ_PARTICLE, particle_strip5, irandom(360), 0.4, 0.2, 1, c_white, false);
}
instance_destroy();