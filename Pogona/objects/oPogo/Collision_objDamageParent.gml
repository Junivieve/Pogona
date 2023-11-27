/// @description take damage / die

if state !=STATE_DEAD{
	stateSet(STATE_DEAD)// all damage causes instant death
	hspd=-hspd
	if vspd>=0{vspd=-vspd}
	alarm[0]=10
	spriteSet(spriteDead)
	audio_play_sound(sndHurt2,1,0)
}