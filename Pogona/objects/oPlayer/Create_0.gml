grv = 0.25; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hspWalk = 2.9; //walk speed
hspMove = 0;
vspJump = -5.4; //jump speed
canJump = 0; //above zero while we are able to jump
onGround = false; //are we on the ground?
canDash = false;
dashDist = 150;
dashTime = 12;
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

mask_index = sCol;

fsm = use_truestate();
fsm.addState(PLAYERSTATE.EGG, playerStateEgg, "playerEgg");
fsm.addState(PLAYERSTATE.HATCH, playerStateHatch, "playerHatch");
fsm.addState(PLAYERSTATE.IDLE, playerStateIdle, "PlayerIdle");
fsm.addState(PLAYERSTATE.SHOOT, playerStateShoot, "PlayerShoot");
fsm.addState(PLAYERSTATE.FALL, playerStateFall, "PlayerFall");
fsm.addState(PLAYERSTATE.LAND, playerStateLand, "PlayerLand");
fsm.addState(PLAYERSTATE.ONWALL, playerStateWallJump, "PlayerOnWall");
fsm.addState(PLAYERSTATE.RUN, playerStateRun, "PlayerRun");
fsm.addState(PLAYERSTATE.JUMP, playerStateJump, "PlayerJump");
fsm.addState(PLAYERSTATE.LEDGE, playerStateLedge, "PlayerLedge");
fsm.addState(PLAYERSTATE.DASH, playerStateDash, "PlayerDash");
keyRight = keyboard_check(vk_right);
keyLeft = keyboard_check(vk_left);
keyDown = keyboard_check(vk_down);
keyJump = keyboard_check_pressed(ord("X"));
keyShoot = keyboard_check_pressed(ord("Z"));
keyDash = keyboard_check_pressed(ord("C"));
onTheGround = 0;
onAWall = 0;


