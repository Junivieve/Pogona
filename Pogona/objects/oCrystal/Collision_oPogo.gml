/// @desc Move to next room
//SlideTransition(TRANS_MODE.GOTO);
oPogo.checkpoint = id;
if(!audio_is_playing(mCheckpoint) && !on) {
	audio_play_sound(mCheckpoint, 1, false);
	on = true;
}
