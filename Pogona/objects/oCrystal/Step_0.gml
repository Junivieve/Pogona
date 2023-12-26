partTime -= 0.01 * global.gameTime;
if(partTime <= 0) {
	CreateParticle(x, y, "PartBack", OBJ_PARTICLE, particle_strip5, irandom(360), 1.2, 26, 1, c_white, false);
	partTime = 0.05;
}