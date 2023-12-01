if(room != rm_menu) {
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
}