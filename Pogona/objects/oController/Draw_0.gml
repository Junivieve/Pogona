if(instance_exists(oPogo)) {
	for (var i = 0; i < oPogo.hp; ++i) {
	    draw_sprite(sHeart, 0, OBJ_CAMERA.cx + 8 + 16 * i, OBJ_CAMERA.cy + 8);
	}

	for (var i = 0; i < oPogo.scales; ++i) {
	    draw_sprite(sScaleUI, 0, OBJ_CAMERA.cx + 8 + 16 * i, OBJ_CAMERA.cy + 24);
	}
}
global.timer += 0.01 * global.gameTime;
global.timerSeconds = global.timer;
if(global.timer >= 10) {
	global.timerTenSeconds ++;
	global.timer = 0;
}
if(global.timerTenSeconds >= 10) {
	global.timerMinutes ++;	
	global.timerTenSeconds = 0;
}
if(global.timerMinutes >= 10) {
	global.timerTenMinutes ++;
	global.timerMinutes = 0;
}

global.timerDisplay = string(global.timerTenMinutes)+string(global.timerMinutes)+":"+string(global.timerTenSeconds)+string(global.timerSeconds);
draw_set_font(fTextSmall);
draw_set_halign(fa_center);
draw_set_color(c_white);
var _cam = OBJ_CAMERA.cam;
draw_text(camera_get_view_x(_cam) + (camera_get_view_width(_cam)/2), camera_get_view_y(_cam)+32, global.timerDisplay);