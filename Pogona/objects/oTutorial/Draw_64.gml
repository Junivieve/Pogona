var _tut = video_draw();

if(_tut[0] == 0) {
	draw_surface(_tut[1], 0, 0);	
}

if(video_get_status() == video_status_closed) {
	oPogo.tutorial ++;
	instance_destroy();
}