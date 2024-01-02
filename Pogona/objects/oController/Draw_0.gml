if(instance_exists(oPogo)) {
	for (var i = 0; i < oPogo.hp; ++i) {
	    draw_sprite(sHeart, 0, OBJ_CAMERA.cx + 8 + 16 * i, OBJ_CAMERA.cy + 8);
	}

	for (var i = 0; i < oPogo.scales; ++i) {
	    draw_sprite(sScaleUI, 0, OBJ_CAMERA.cx + 8 + 16 * i, OBJ_CAMERA.cy + 24);
	}
}