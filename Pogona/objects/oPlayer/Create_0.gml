grv = 0.25; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hspWalk = 2.2; //walk speed
hspMove = 0;
vspJump = -4.6; //jump speed
canJump = 0; //above zero while we are able to jump
onGround = false; //are we on the ground?
draw_image_xscale = 1;
dir = 1;
draw_image_yscale = 1;
scales = 1;
targ_x = x;
targ_y = y;
hasTurned = false;
walkSoundTime = 1;

fsm = use_truestate();
fsm.addState(PLAYERSTATE.IDLE, playerStateIdle, "PlayerIdle");
fsm.addState(PLAYERSTATE.SHOOT, playerStateShoot, "PlayerShoot");
fsm.addState(PLAYERSTATE.FALL, playerStateFall, "PlayerFall");
fsm.addState(PLAYERSTATE.LAND, playerStateLand, "PlayerLand");

keyRight = keyboard_check(vk_right);
keyLeft = keyboard_check(vk_left);
keyJump = keyboard_check_pressed(ord("X"));
keyShoot = keyboard_check_pressed(ord("Z"));

/*
if(!audio_is_playing(mCave)) {
	audio_play_sound(mCave, 1, true);
}

if(!audio_is_playing(mGameOn)) {
	audio_play_sound(mGameOn, 1, false);
}
