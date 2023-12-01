global.gameTime = ((60/1000000) * delta_time);
global.timer = 0;
function addhearts() {
	hearts = [];
	scales = [];
	for (var i = 0; i < oPogo.hp; ++i) {
		array_push(hearts, heartsPanel.add(new UISprite("HeartImage"+string(i), 8 + (16 * i), 0, sHeart))); 
	}
	for (var i = 0; i < oPogo.scales; ++i) {
		array_push(scales, heartsPanel.add(new UISprite("HeartImage"+string(i), 9 + (16 * i), 18, sScaleUI))); 
	}
}
if(room != rm_menu) {
	timerText = 0;
	mins = 0;
	heartsPanel = new UIPanel("HeartsPanel", 4, 9, 300, 160, -1);
	addhearts();
}
