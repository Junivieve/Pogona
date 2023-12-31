enum CAMERA_MODE {
	FOLLOW_OBJECT,
	FOLLOW_MOUSE_BORDER,
	FOLLOW_MOUSE_PEAK,
	MOVE_TO_TARGET,
	MOVE_TO_FOLLOW_TARGET
}

cam = view_camera[0];
mode = CAMERA_MODE.MOVE_TO_FOLLOW_TARGET;
following = oPogo;
targetX = 1262;
targetY = 109;
free = false;
cx = camera_get_view_x(cam);
cy = camera_get_view_y(cam);
view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);
shake = false;
shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;