global.gameTime = ((60/1000000) * delta_time);
global.timer = 0;
if(room != rm_menu) {
	timerText = 0;
	mins = 0;
	scribble_font_bake_outline_8dir_2px("fTextNormal", "fTextNormalOutlined", c_black, true);
	scribble_font_set_default("fTextNormalOutlined");

	heartsPanel = new UIPanel("HeartsPanel", 16, 96, 300, 160, -1);
	hearts = [];
	for (var i = 0; i < oPogo.hp; ++i) {
	   array_push(hearts, heartsPanel.add(new UISprite("HeartImage"+string(i), 8 + (32 * i), 8, sHeart))); 
	}
}
