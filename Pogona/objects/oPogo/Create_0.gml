/// @description Initilize player

//movement settings
hasDash = false;
hasClimb = false;
hasShoot = false;
iframe = 0;
shot = false;
dashSpeed=4//how fast we move when dashing
dashLength=15//how many frames we dash for
dashPreLength=5//how many frames the game freezes, when you initiate a dash (so the player has time to aim the dash)
walkSpeed=2//how fast we walk
jumpPower=3.25//how high we jump
jumpsMax=1//how many jumps we have (does not do anything with values > 1 yet)
dashesMax=1//how many air dashes we have (does not do anything with values > 1 yet)
coyoteTimeMax=5//how many frames late can we jump, when falling off a ledge
staminaMax=2000//how many frames can we climb up walls
grav=0.15//gravity
scales = 0;
canshoot = true;
//various movement variables
dashXX=1//used for aiming the air dash
dashYY=0//used for aiming the air dash
hspd=0//horizontal movement speed
vspd=0//vertical movement speed
checkpoint = noone;
//timers
noFallTimer=0//after an air dash, the player has no gravity for several frames
idleTimer=0//counts how long we have been idle for, used to set idle animations
ignoreInputTimer=0//after a wall jump etc, there are several frames where we ignore controller/keyboard input
walkTimer=0//a timer for playing walking sounds
hp = 2;
hpmax = 2;
jumps=jumpsMax//setting jump to the value we defined earlier
dashes=dashesMax//setting dashes to the value we defined earlier
coyoteTime=coyoteTimeMax//setting coyote time to the value we defined earlier
stamina=staminaMax//setting stamina to the value we defined earlier
tutorial = 0;
state=STATE_EGG//the player's state machine
statePrevious=STATE_EGG//previous state
stateSet(STATE_EGG);//actually setting the state
setSpritesFromDash()//defines sprites based on how many dashes we have left
spriteSet(spriteIdle)//finally we set our sprite


if(!audio_is_playing(mCave)) {
	audio_play_sound(mCave, 1, true);
}

if(!audio_is_playing(mGameOn)) {
	audio_play_sound(mGameOn, 1, false);
}

if(!audio_is_playing(PogonaTheme)) {
	audio_play_sound(PogonaTheme, 1, true);
}

