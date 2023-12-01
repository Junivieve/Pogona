menu = new UIPanel("menuPanel", window_get_width()/2-250, 80, 500, 800, -1);
menu.setDraggable(false);
startbutton = menu.add(new UIButton("startButton", 8, 8, 100, 40, "Start", blue_button00));
//menu.destroy();
with(startbutton) {
	setDraggable(false);	
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		room_goto_next();
		var _m = getParent();
		_m.destroy();
	});	
}
quitbutton = menu.add(new UIButton("quitButton", 8, 60, 100, 40, "Quit", blue_button00));
with(quitbutton) {
	setDraggable(false);	
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		game_end();
	});	
}	