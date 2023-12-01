global.gameTime = ((60/1000000) * delta_time);
global.timer = 0;

timerText = 0;
mins = 0;
scribble_font_bake_outline_8dir_2px("fTextNormal", "fTextNormalOutlined", c_black, true);
scribble_font_set_default("fTextNormalOutlined");

//var _heartsPanel = new UIPanel("Hearts", 32, 96, 300, 160, blue_panel);
//var _heart = _heartsPanel.add(new UISprite("Heart", 16, 16, sHeart));