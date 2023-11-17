if(!UI.exists("Timer")) {
	var _panel = new UIPanel("Timer", 32, 32, 500, 48, -1);
	timerText = _panel.add(new UIText("TimerText", 50, 24, global.timer));
}

if(timerText != 0) {
	if(global.timer > 59) {
		mins ++;
		global.timer = 0;
	}
	timerText.setText(string(mins) + ":" + string(global.timer));
}

for (var i = 0; i < room_width/16; ++i) {
    for (var j = 0; j < room_height/16; ++j) {
		draw_set_color(c_blue);
		draw_rectangle(i, j, i*16, j*16, true);
	}
}