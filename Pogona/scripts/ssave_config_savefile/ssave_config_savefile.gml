
function ssave_config_savefile() : SSave("savefile") constructor {
	add_value("timer", SSAVE_TYPE.REAL, 0);
	add_value("completed", SSAVE_TYPE.BOOLEAN, false);
	add_value("level", SSAVE_TYPE.STRING, room_get_name(room));
	add_value("hasDash", SSAVE_TYPE.BOOLEAN, false);
	add_value("hasClimb", SSAVE_TYPE.BOOLEAN, false);
	add_value("hasShoot", SSAVE_TYPE.BOOLEAN, false);
	add_value("numberOfScales", SSAVE_TYPE.REAL, 0);
}