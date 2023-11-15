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
mvtLocked = 0;
jumpBuffer = 0;

fsm = use_truestate();
fsm.addState(PLAYERSTATE.EGG, playerStateEgg, "playerEgg");
fsm.addState(PLAYERSTATE.HATCH, playerStateHatch, "playerHatch");
fsm.addState(PLAYERSTATE.IDLE, playerStateIdle, "PlayerIdle");
fsm.addState(PLAYERSTATE.SHOOT, playerStateShoot, "PlayerShoot");
fsm.addState(PLAYERSTATE.FALL, playerStateFall, "PlayerFall");
fsm.addState(PLAYERSTATE.LAND, playerStateLand, "PlayerLand");
fsm.addState(PLAYERSTATE.ONWALL, playerStateWallJump, "PlayerOnWall");
fsm.addState(PLAYERSTATE.RUN, playerStateRun, "PlayerRun");

keyRight = keyboard_check(vk_right);
keyLeft = keyboard_check(vk_left);
keyJump = keyboard_check_pressed(ord("X"));
keyShoot = keyboard_check_pressed(ord("Z"));
onTheGround = 0;
onAWall = 0;

if(!audio_is_playing(mCave)) {
	audio_play_sound(mCave, 1, true);
}

if(!audio_is_playing(mGameOn)) {
	//audio_play_sound(mGameOn, 1, false);
}

if(!audio_is_playing(mMenu)) {
	audio_play_sound(mMenu, 1, true);
}
