//scribble_font_bake_outline_8dir_2px("fTextSmall", "fTextNormalOutlined", c_black, true);
scribble_font_set_default("fTextSmall");
menu = new UIPanel("menuPanel", room_width/2-60, room_height/2, 140, 80, -1);
menu.setDraggable(false);
titlePanel = new UIPanel("titlePanel", 0, 10, room_width, 40, -1);
titlePanel.add(new UIText("title", room_width/2, 10, "Pogona"));
creditsPanel = new UIPanel("creditsPanel", 0, room_height-30, room_width, 30, -1);
creditsPanel.add(new UIText("credits", room_width/2, 15, "Made for the GameOff 2023 Game Jam by Juniper & Farolino"));
startbutton = menu.add(new UIButton("startButton", 30, 8, 60, 30, "Start", sButton));
//menu.destroy();
	startbutton.setDraggable(false);
	startbutton.setTextFormat("[#eeaf8a]");
	startbutton.setCallback(UI_EVENT.LEFT_RELEASE, function() {
		room_goto(Lvl3Faro);
		var _m = startbutton.getParent();
		audio_stop_sound(PogonaMenu);
		_m.destroy();
		titlePanel.destroy();
		creditsPanel.destroy();
	});	

quitbutton = menu.add(new UIButton("quitButton", 30, 48, 60, 30, "Quit", sButton));
with(quitbutton) {
	setDraggable(false);	
	setTextFormat("[#eeaf8a]");
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		game_end();
	});	
}
audio_play_sound(PogonaMenu, 1, true);
