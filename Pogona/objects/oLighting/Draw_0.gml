if(!surface_exists(light_surf)) {
	light_surf = surface_create(room_width, room_height);	
} else {
	
	surface_set_target(light_surf);
	draw_clear(c_black);
	
	with(oPogo) {
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(sGlowWhite, 0, x, y, 1, 1, 0, c_white, 0.3);
		
		
		gpu_set_blendmode(bm_normal);
		draw_sprite_ext(sGlowWhite, 0, x, y, 1, 1, 0, c_white, 0.8);
	}
	with(oCrystal) {
				
		gpu_set_blendmode(bm_normal);
		draw_sprite_ext(sGlowWhite, 0, x, y, 0.5, 0.5, 0, c_white, 1);
	}
	with(oTorch) {
				
		gpu_set_blendmode(bm_normal);
		draw_sprite_ext(glowBig, 0, x, y, apply_sin(0.5,-0.2,0.002), apply_sin(0.5,-0.2,0.002), 0, c_white, 1);
	}


	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface_ext(light_surf, 0, 0, 1, 1, 0, c_white, darkness);
}