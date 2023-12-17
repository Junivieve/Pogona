/// @description Healthbar
if(hp < hp_max) {
	draw_sprite(sBossHealthBarBack,0,healthbar_x,healthbar_y);
	draw_sprite_stretched(SBossHealthbarSlider,0,healthbar_x,healthbar_y,(hp/hp_max) * healthbar_width, healthbar_height);
	draw_sprite(sBossHealthBarFrame,0,healthbar_x,healthbar_y);
	var _healthbarPadMiddle = (healthbar_width/2);
	var _healthbarPadTop = 5;
	draw_sprite(sBossHealthBarName,0,healthbar_x + _healthbarPadMiddle,healthbar_y - _healthbarPadTop);
}