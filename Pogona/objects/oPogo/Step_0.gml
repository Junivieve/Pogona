/// @description Event

//GRAVITY
#region gravity

var _grounded=false//default to not being on the ground
if meetingWall(x,y+1){//check to see if there is ground below us
	_grounded=true//set the grounded flag if we are on solid ground
	resetStats()//resets coyoteTime,jumps stamina etc
}else{
	coyoteTime--//count down coyote time if we are in the air
	if noFallTimer<=0 and vspd<3{//make sure we should be applying gravity
		vspd+=grav//apply gravity
	}
}

#endregion

//TIMERS
#region timers
//we have several timers to index here
stateTimer++//how long have we been in our current state
ignoreInputTimer--//no input
noFallTimer--//no gravity
#endregion

//SPRITES
setSpritesFromDash()//update our sprites based on how many dashes we have left

//STATE MACHINE
#region state machine
if state=STATE_DEAD{//dead
	if stateTimer=1{sleep(250)}//first frame of death, we pause the game for 1/4 second
	spriteSet(spriteDead)//set the sprite
	pixelMovement(hspd,vspd)//move the player
	hspd=hspd*0.9 //slowly reduce movement speed
	vspd=vspd*0.9 //slowly reduce movement speed
	exit//exit the step event
}

if state=STATE_IDLE{//idle

	if _grounded{hspd=hspd*0.5 vspd=0}//friction for ground 
	else{hspd=hspd*0.6}//friction for air
	
	//we have a few bonus idle animations, if we are not in those, make sure we are in spriteIdle
	if sprite_index !=spriteIdle and sprite_index !=spriteIdleBlink{
		spriteSet(spriteIdle)
	}
	
	idleTimer++//track how long the player hasnt moved
	if idleTimer>300{//if the player has been idle for 5 seconds
		stateSet(STATE_WAIT)//switch to the WAIT state
		spriteSet(choose(spriteWait1,spriteWait2,spriteWait3))//and play a new animation
	}
	
	if inputVert()==1{//player is holding down
		stateSet(STATE_DUCK)//duck state
	}
	
	if abs(inputSides())>0{stateSet(STATE_WALK)}//player is holding left or right, switch to walk state
	
	if inputAction(){stateSet(STATE_JUMP)}//player pressed jump
	
	if vspd>0{stateSet(STATE_FALL)}//falling off a ledge
	
}else{//if the player is not in the idle state
	idleTimer=0//set idle time to 0
}

if state=STATE_WAIT{//wait
	//check if the player has pressed a key or button
	if keyboard_check(vk_anykey) or inputAction() or abs(inputSides())>0 or abs(inputVert())>0{
		stateSet(STATE_IDLE)//switch back to idle state
		spriteSet(spriteIdle)//set the idle sprite
		
		if inputAction(){
			stateSet(STATE_JUMP)//jump if the player pressed the jump button
		}
	}
}

if state=STATE_WALK{//walking
	
	spriteSet(spriteWalk)//set our sprite
	
	if walkInput()=0{// if the player is no longer holding left / right
		stateSet(STATE_IDLE)//switch to idle
	}else{
		if stateTimer=0{walkTimer=20}//forces a step sound when you first move
		walkTimer+=1//timer for walk sounds
		if walkTimer>20{//if its been 20 frames, play a walk sound
			audio_play_sound(choose(sndWalk1,sndWalk2,sndWalk3,sndWalk4),1,0)
			//instance_create_depth(x,y+10,depth-1,objDust)
			walkTimer=0
		}
	}
	
	if inputAction(){
		stateSet(STATE_JUMP)//jump
	}
	
	if vspd>0{stateSet(STATE_FALL)}//falling
}

if state=STATE_FALL{//falling
	
	var _walk=walkInput()
	if _walk=0 and ignoreInputTimer<=0{hspd=hspd*0.6}//air friction if not moving
	spriteSet(spriteFall)//set sprite
	if image_index>2.5{image_index=2}
	
	if _grounded{//landing on the ground
		audio_play_sound(sndLand2,1,0)//play land sound
		//repeat(5){instance_create_depth(x,y+10,depth-1,objDust)}//make some dust
		stateSet(STATE_IDLE)//set state to idle
	}
	
	//if the player is pressing into a wall, switch to wall slide
	if (_walk=-1 and meetingWall(x-1,y)) or (_walk=1 and meetingWall(x+1,y)) {
		stateSet(STATE_WALLSLIDE)
	}
	
	if inputAction(){//player presses action button
		if coyoteTime>0{stateSet(STATE_JUMP)}//we jump or
		else{if dashes>0{stateSet(STATE_DASH)}}//we dash
		
	}
}

if state=STATE_JUMP{//jumping
	
	var _walk=walkInput()
	if _walk=0 and ignoreInputTimer<=0 {hspd=hspd*0.6}//air friction
	spriteSet(spriteJump)//sprite
	if image_index>3{image_index=2}//loops the falling part of the jump animation
	
	if stateTimer=0{//if this is the first frame of the state
		if coyoteTime>0 and jumps>0{//if we can jump
			vspd=-jumpPower //actually jump 
			jumps--//remove ability to jump
			audio_play_sound(sndJump2,1,0)//play sound
			//repeat(5){instance_create_depth(x,y+10,depth-1,objDust)}//make dust
		}else{
			stateSet(statePrevious)//if we cant jump, revert to our previous state
		}
	}
	
	if inputActionReleased() and vspd<0{//releasing jump
		vspd=vspd/2//slows the player down, so we can do shorter jumps
	}
	
	if vspd>=0{stateSet(STATE_FALL)}//once we start traveling down, switch to fall state
	
	if inputAction() and stateTimer>1 {stateSet(STATE_DASH)}//dash if button is pressed again
}

if state=STATE_WALLSLIDE{//wall slide
	
	if stateTimer=0{
		audio_play_sound(sndLand2,1,0)//land sound on state's first frame
	}
	
	vspd=vspd*min((stateTimer+40)/60,1)//slowly increase speed the longer we slide
	
	if _grounded{stateSet(STATE_IDLE)}//revert back to idle state
	
	
	var _climb=inputVert()//check for the player holding up
	if _climb <0 and stamina>0{//if we have stamina and are holding up
		vspd=_climb//climb up
		stamina--//reduce stamina
		stateTimer=0//reset falling speed
		spriteSet(spriteWallClimb)//sprite
	}else{
		spriteSet(spriteWallSlide)//sprite
		if stamina<=0{spriteSet(spriteWallSlideSad)}//we ran out of stamina
	}	
	
	if inputAction(){jumpOffWall()}//wall jump
	
	if !meetingWall(x+(image_xscale),y){stateSet(STATE_FALL)}//climbing over the top of a wall
	
	var _walk=inputSides()
	if _walk=-image_xscale{//pressing the opposite direction to fall off a wall
		stateSet(STATE_FALL)
		coyoteTime=coyoteTimeMax//set coyote time so the player can jump after relasing from the wall
	}
	
}
	
if state=STATE_DASH{//dash
	spriteSet(spriteDash)//sprite
	
	if stateTimer=0{
		if dashes<=0{
			stateSet(statePrevious)//cancel the dash if it has no charges left
			exit
		}else{
			dashXX=image_xscale//default to straight dash
			dashYY=0
		}
	}
	
	if stateTimer<dashPreLength{//during the pre-dash we can set the direciton of the dash
		if abs(inputSides()>0){
			dashXX=inputSides()
			//dashYY=inputVert()
		}
		hspd=0//dont move during pre-dash
		vspd=0
		image_index=0
		
		if dashXX>0{image_xscale=1}//switching the sprite left / right
		if dashXX<0{image_xscale=-1}
	}
	
	if stateTimer==dashPreLength{//when pre-dash is over, play a sound
		audio_play_sound(sndDash2,1, 0)
		dashes--//remove a dash charge
	}
	
	if stateTimer>dashPreLength and stateTimer<dashLength{//the movement part of the dash
		var _dir=point_direction(0,0,dashXX,dashYY)//find our direction
		hspd=lengthdir_x(dashSpeed,_dir)//move x
		vspd=lengthdir_y(dashSpeed,_dir)//move y
		//instance_create_depth(x,y,depth-1,objDust)//dusty boi
	
	}
	
	if stateTimer>dashLength{//end of dash
		noFallTimer=3//few frames of no gravity
		stateSet(STATE_FALL)//switch to falling
	}
	
}

if state=STATE_HURT{//hurt
	spriteSet(spriteHurt)//sprite
	//i did not really end up using this state for anything
}

if state=STATE_DUCK{//ducking
	spriteSet(spriteDuck)
	if !inputVert()==1{
		stateSet(STATE_IDLE)//back to idle
	}
	if _grounded{hspd=hspd*0.5 vspd=0}//friction
	//this state has no use currently, it just makes the cat duck :D
}
#endregion

//out of stamina effect
#region stamina effect
if stamina<=0{
	if random(100)>90{
		//var _b=instance_create_depth(x,y,depth-1,objDust)
		//_b.direction=random_range(250,290)
	}
}
#endregion

pixelMovement(hspd,vspd)//move the character across the screen