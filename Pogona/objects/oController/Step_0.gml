global.gameTime = ((60/1000000) * delta_time);
if(room != rm_menu) {
	global.timer += 0.01 * global.gameTime;
}

if(keyboard_check_pressed(vk_f5)) {
	var _fs = window_get_fullscreen();
	switch(_fs) {
		case false:
		    window_set_fullscreen(true);
			displayW = display_get_width();
			displayY = display_get_height();

			camera_create_view(0, 0, displayW, displayY)
			surface_resize(application_surface,displayW,displayY);
		break;
		
		case true:
		    window_set_fullscreen(false);
			displayW = display_get_width();
			displayY = display_get_height();

			camera_create_view(0, 0, displayW/4, displayY/4)
			surface_resize(application_surface,displayW/4,displayY/4);
		break;
	}
}