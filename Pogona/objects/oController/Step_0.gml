global.gameTime = ((60/1000000) * delta_time);
if(room != rm_menu) {
	global.timer += 0.01 * global.gameTime;
}