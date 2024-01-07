draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(OBJ_CAMERA.cx, OBJ_CAMERA.cy, OBJ_CAMERA.cx + RES.WIDTH, OBJ_CAMERA.cy + RES.HEIGHT, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text_scribble(OBJ_CAMERA.cx + 240, OBJ_CAMERA.cy + 32, "[wave]Game Paused[/wave]");
for (var i = 0; i < array_length(menu); ++i) {
	if(i == selected) {
		draw_text_scribble(OBJ_CAMERA.cx + 240, OBJ_CAMERA.cy + 100 + ( 32 * i), "[pulse]"+menu[i]+"[/pulse]");
	} else {
		draw_text_scribble(OBJ_CAMERA.cx + 240, OBJ_CAMERA.cy + 100 + ( 32 * i), menu[i]);
	}
}