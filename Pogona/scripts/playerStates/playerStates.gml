function playerStateIdle(_event, _layer) {
	switch(_event) {
		case TrueStateEvent.onEnter:
			sprite_index = sDragonIdle;
		break;
		
		case TrueStateEvent.onStep:
			if (place_meeting(x,y+1,oBox)) {
				canJump = 10;
			}
			if (canJump > 0) && (keyJump)
			{
			    vsp = vspJump;
				_layer.stateSwitch(PLAYERSTATE.FALL);
				randomize();
				audio_play_sound(choose(mJump1, mJump2, mJump3, mJump4, mJump5, mJump6), 1, false);
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
					_layer.stateSwitch(PLAYERSTATE.FALL);
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
			repeat(3) {
				CreateParticle(x, y, "Instances", OBJ_PARTICLE, sDustParticle, irandom_range(180, 0), 0.3, 1.2, 1, c_white, true);
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
			sprite_index = sDragonJump;
		break;
		
		case TrueStateEvent.onStep:
			if(image_index >= 3) {
				image_index = 3;
				image_speed = 0;	
			}
			if(place_meeting(x, y+1, oBox)) {
				image_speed = 1;
				_layer.stateSwitch(PLAYERSTATE.LAND);	
			}
		break;
	}
}