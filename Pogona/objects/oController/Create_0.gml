global.gameTime = ((60/1000000) * delta_time);
global.timer = 0;
global.timerTenMinutes = 0;
global.timerMinutes = 0;
global.timerTenSeconds = 0;
global.timerSeconds = 0;
global.targetRoom = room_get_name(room);
depth = -9999;

global.saveGame = function()
{
	static _config = ssave_get(ssave_config_savefile);
    _config.set("timer", global.timer)
	_config.set("completed", false)
	_config.set("level", global.targetRoom)
	_config.set("hasDash", oPogo.hasDash)
	_config.set("hasShoot", oPogo.hasShoot)
	_config.set("hasClimb", oPogo.hasClimb)
	_config.set("numberOfScales", oPogo.scales)
	_config.save();
}
