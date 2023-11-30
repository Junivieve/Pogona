partTime -= 0.01 * global.gameTime;
if(partTime <= 0) {
	CreateParticle(x+4, y, "Instances", OBJ_PARTICLE, particle_strip5, irandom(360), 1.2, 26, 1, c_white, false);
	partTime = 0.05;
}