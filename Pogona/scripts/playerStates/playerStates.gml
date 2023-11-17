function playerStateEgg(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
			sprite_index = sDragonEggHatch;
			image_speed = 0;
		break;
		
		case TrueStateEvent.onStep:
		
			if(keyboard_check_pressed(vk_anykey)) {
				_layer.stateSwitch(PLAYERSTATE.HATCH);	
			}
		break;
	}
}
function playerStateHatch(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
			sprite_index = sDragonEggHatch;
			image_speed = 1;
		break;
		
		case TrueStateEvent.onStep:
		var _hatched = AnimationEnd();
			if(_hatched) {
				instance_create_layer(x, y, "Instances", oEgg);
				_layer.stateSwitch(PLAYERSTATE.IDLE);	
			}
		break;
	}
}
function playerStateIdle(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
			sprite_index = sDragonIdle;
			hspWalk = 2.2;
		break;
		
		case TrueStateEvent.onStep:
			if (place_meeting(x,y+1,oBox)) {
				canJump = 10;
				if(hsp != 0) {
					_layer.stateSwitch(PLAYERSTATE.RUN);	
				}
			}
			if (canJump > 0) {
				if(keyJump or jumpBuffer > 0) {
					vsp = vspJump;
					jumpBuffer = 0;
					_layer.stateSwitch(PLAYERSTATE.JUMP);
					randomize();
						audio_play_sound(choose(mJump1, mJump2, mJump3, mJump4, mJump5, mJump6), 1, false);
				}
			}

			if(keyShoot) {
				_layer.stateSwitch(PLAYERSTATE.SHOOT);
			}		
		break;
		
		case TrueStateEvent.onDraw:
		
		break;
	}
}
function playerStateShoot(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
			sprite_index = sDragonShoot;
			var _scale = instance_create_layer(x, y-5, "Instances", oScale);
			_scale.dir = dir;
			scales --;
		break;
		
		case TrueStateEvent.onStep:
			if(_layer.timer > 12) {
				if(!place_meeting(x,y+1,oBox)) {
					//_layer.stateSwitch(PLAYERSTATE.FALL);
				} else {
					_layer.stateSwitch(PLAYERSTATE.IDLE);	
				}
			}
		break;
	}
}
function playerStateLand(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
		sprite_index = sDragonLand;
			repeat(10) {
				CreateParticle(x, y, "Instances", OBJ_PARTICLE, sDustParticle, irandom_range(180, 0), 0.4, 3, 1, c_white, true);
			}
		break;
		
		case TrueStateEvent.onStep:
			if(_layer.timer > 12) {
				_layer.stateSwitch(PLAYERSTATE.IDLE);	
			}
		break;
	}	
}
function playerStateFall(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
			if(hsp != 0) {
				sprite_index = sDragonFalling;
			}
		break;
		
		case TrueStateEvent.onStep:
			if(keyJump && jumpBuffer < 1) {
				jumpBuffer ++;	
			}
			if(onAWall != 0) {
				_layer.stateSwitch(PLAYERSTATE.ONWALL);	
			}
			if(place_meeting(x, y+1, oBox)) {
				image_speed = 1;
				_layer.stateSwitch(PLAYERSTATE.LAND);	
			}
			show_debug_message(vsp);
			if(vsp > 5) {
				hspWalk = 0;	
			} else {
				hspWalk = 2.2;
			}
		break;
	}
}
function playerStateWallJump(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
			dir = onAWall;
		break
		
		case TrueStateEvent.onStep:
			if(keyJump) {
				vsp = vspJump;	
				hsp = -onAWall * hspMove;
				_layer.stateSwitch(PLAYERSTATE.FALL);
			}
		
			if(place_meeting(x, y+1, oBox)) {
				image_speed = 1;
				_layer.stateSwitch(PLAYERSTATE.LAND);	
			}		
		break;
	}
}
function playerStateRun(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
			sprite_index = sDragonRun;
		break;
		
		case TrueStateEvent.onStep:
			if (place_meeting(x,y+1,oBox)) {
				canJump = 10;
				if(hsp == 0) {
					_layer.stateSwitch(PLAYERSTATE.IDLE);	
				}
			}
			if (canJump > 0) {
				if(keyJump or jumpBuffer > 0) {
					vsp = vspJump;
					jumpBuffer = 0;
					_layer.stateSwitch(PLAYERSTATE.JUMP);
					randomize();
						audio_play_sound(choose(mJump1, mJump2, mJump3, mJump4, mJump5, mJump6), 1, false);
				}
			}	
		break;
	}
}
function playerStateJump(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
			image_index = 0;
			sprite_index = sDragonJump;
		break;
		
		case TrueStateEvent.onStep:
			if(_layer.timer > 18) {
				_layer.stateSwitch(PLAYERSTATE.FALL);	
			}
		break;
	}
}