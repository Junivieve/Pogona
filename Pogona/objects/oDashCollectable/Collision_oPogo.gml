oPogo.hasDash = true;
audio_play_sound(mcollectable, 1, false);
screenshake(0.5, 0.2, 0.2);
repeat(6) {
	CreateParticle(x, y, "Instances", OBJ_PARTICLE, particle_strip5, irandom(360), 0.4, 0.2, 1, c_white, false);
}
instance_destroy();