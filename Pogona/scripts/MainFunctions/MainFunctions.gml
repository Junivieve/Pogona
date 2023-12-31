 //MACROS
#region macros
#macro STATE_IDLE 0
#macro STATE_WAIT 1
#macro STATE_FALL 2
#macro STATE_WALK 3
#macro STATE_JUMP 4
#macro STATE_WALLSLIDE 5
#macro STATE_DASH 6
#macro STATE_HURT 7
#macro STATE_DEAD 8
#macro STATE_DUCK 9
#macro STATE_SHOOT 10
#macro STATE_EGG 11
#macro STATE_MOVING_WITH_PLATFORM 12
#endregion

function stateSet(_state){//simple state machine handler
	statePrevious=state;
	state=_state;
	stateTimer=0;
	return _state;
}

function spriteSet(_spr){//sets a sprite if its not already set and restarts the animation
	if sprite_index != _spr{
		sprite_index=_spr
		image_index=0
	}
}

function walkInput(){//walk if the player is pushing left or right
	if ignoreInputTimer>0{
		return 0;
	}
	var _walk=inputSides()
	hspd=clamp(hspd+_walk,-walkSpeed,walkSpeed)
	
	if _walk=-1{image_xscale=-1}
	if _walk=1{image_xscale=1}
	
	return _walk
}
	
function jumpOffWall(){//wall jumpping
	stateSet(STATE_JUMP)
	hspd=-image_xscale*2//push away from wall
	vspd=-(jumpPower-1)//jump up
	ignoreInputTimer=15//ignore input for 15 frames
	//repeat(5){instance_create_depth(x+(image_xscale*8),y,depth-1,objDust)}//more dust
	audio_play_sound(sndJump2,1,0)//jump noises
	image_xscale=-image_xscale	
}

function pixelMovement(h,v){//pixel perfect movement
	// moving platform
	var _mp = instance_place(x, y+max(1, v), oMovingPlatform);
	if(_mp && bbox_bottom <= _mp.bbox_top) {
		if(v > 0) {
			while(!place_meeting(x, y + sign(v), oMovingPlatform)) {
				y += sign(v);
			}	
			
			v = 0;
		}
		
		x += _mp.hspd;
		y += _mp.vspd;
	}
	
	if meetingWall(x+h,y) and h != 0 {
	    repeat(abs(h)){
	        if meetingWall(x+sign(h),y)=false{
	            x+=sign(h)
	        }else{
	            h=0
				hspd=0
	            break
	        }
	    }
	}else{x+=h}
    
	// vertical movement
	if meetingWall(x,y+v) and v != 0{
	    repeat(abs(v)){
	        if meetingWall(x,y+sign(v))=false{
	            y+=sign(v)
	        }else{
	            v=0
				vspd=0
	            break
	        }
	    }
	}else{y+=v}
	
		// Moving Platform collision
	var _movingPlatform = instance_place(x, y + max(1, vspd), oMovingPlatformSmall);
	if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
		//Pixel perfect collisions
		if (vspd > 0) {
			while (!place_meeting(x, y + sign(vspd), oMovingPlatformSmall)) {
				y += sign(vspd);
			}
			stateSet(STATE_MOVING_WITH_PLATFORM);
		}
	}
}
	
function setSpritesFromDash(){//set the players sprites based on dashes
	spriteIdle=sPogoIdle
	spriteIdleBlink=sPogoIdle
	spriteWait1=sPogoIdle
	spriteWait2=sPogoIdle
	spriteWait3=sPogoIdle
	spriteWalk=sPogoRun
	spriteJump=sPogo_jump_12fps
	spriteFall=sPogo_fall_12fps
	spriteWallSlide=sPogo_wallgrab_8fps
	spriteWallSlideSad=sPogo_wallgrabSad_8fps
	spriteWallClimb=sPogoClimb
	spriteDash=sPogo_dash_12fps
	spriteHurt=sPogoHurt;
	spriteDead=sPogoDie;
	spriteDuck=sPogo_crouch_8fps
	spriteShoot=sPogoShoot; 
	spriteHang=sPogoHang;
}
	
function resetStats(){//resets the players coyote time, jump, dashes, and stamina
	coyoteTime=coyoteTimeMax
	jumps=jumpsMax
	stamina=staminaMax
	dashes=dashesMax
}
	
function inputAction(){//returns if the player pressed the action button
	if keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face1){
		return true;
	}else{
		return false;
	}
}

function inputActionReleased(){//returns if the player released the action button
	if keyboard_check_released(vk_space) or gamepad_button_check_released(0,gp_face1){
		return true;
	}else{
		return false;
	}
}

function inputShoot(){//returns if the player pressed the action button
	if mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(0,gp_face2){
		return true;
	}else{
		return false;
	}
}

function inputShootReleased(){//returns if the player released the action button
	if mouse_check_button_released(mb_left) or gamepad_button_check_released(0,gp_face2){
		return true;
	}else{
		return false;
	}
}

function inputSides(){//returns -1 or 1 for players horizontal input
	var _gp=gamepad_axis_value(0,gp_axislh);
	var _axis=0;

	_axis+=keyboard_check(ord("D"));
	_axis-=keyboard_check(ord("A"));
	
	if abs(_gp)>0.5{_axis=sign(_gp)}

	return _axis;

}

function inputVert(){//returns -1 or 1 for players vertical input
	var _gp=gamepad_axis_value(0,gp_axislv);
	var _axis=0;

	_axis+=keyboard_check(ord("S"));
	_axis-=keyboard_check(ord("W"));
	
	if abs(_gp)>0.5{_axis=sign(_gp)}

	return _axis;
}
	
function meetingWall(_x,_y){//returns if we meet a wall at a positon 
	var _hit=false;
	if place_meeting(_x,_y,oBox){_hit=true}//meeting normal wall
	if vspd>=0 and place_meeting(_x,_y,oScalePlatform) 
	and !place_meeting(x,y,oScalePlatform){_hit=true}//meeting oneway platform
	return _hit;
}

function sleep(_ms){//simple function to freeze the game for a set amount of time
	var _t=current_time
	do{
		//do nothign at all, locks up the user's game.
	}until(current_time-_t>_ms)
}