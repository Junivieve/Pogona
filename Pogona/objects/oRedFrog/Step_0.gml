switch(state) {
	case REDFROGSTATE.IDLE:
		sprite_index = sRedFrogIdle;
		speed = 0;
		if(point_distance(x, y, oPogo.x, oPogo.y) < 32) {
			if(canAttack && oPogo.state != STATE_DEAD && oPogo.iframe == 0) {
				state = REDFROGSTATE.ATTACK;	
				image_index = 0;
				canAttack = false;
				if(image_xscale != oPogo.image_xscale * -1) {
					image_xscale = oPogo.image_xscale * -1;
				}
			}
		} else {
			canAttack = true;	
		}
	break;
	case REDFROGSTATE.MOVE: 
		movetime -= 0.01 * global.gameTime;
		y += 1.6;
		if(movetime <= 0) {
			speed = speed == 0 ? 1 : 0;
			movetime = 4;
		}

		image_xscale = direction == 0 ? 1 : -1;

		switch(speed) {
			case 0:
				sprite_index = sRedFrogIdle;
			break;
	
			case 1:
				sprite_index = sRedFrogJump;
			break;
		}
		if(point_distance(x, y, oPogo.x, oPogo.y) < 32) {
			if(canAttack && oPogo.state != STATE_DEAD && oPogo.iframe == 0) {
				state = REDFROGSTATE.ATTACK;	
				image_index = 0;
				canAttack = false;
				if(image_xscale != oPogo.image_xscale * -1) {
					image_xscale = oPogo.image_xscale * -1;
				}
			}
		} else {
			canAttack = true;	
		}
	break;
	
	case REDFROGSTATE.ATTACK:
		sprite_index = sRedFrogAttack;
		
		if(image_index >= image_number-1) {
			state = REDFROGSTATE.MOVE;	
			movetime = 3;
		}
		
		if(place_meeting(x, y, oPogo) && oPogo.iframe == 0) {
			oPogo.hspd += 3 * (-oPogo.image_xscale);
			oPogo.vspd -= 2;
			oPogo.state = STATE_HURT;
			audio_play_sound(mFroghit, 1, false);
			oPogo.hp =0; //oPogo.hp --;
			oPogo.iframe = 1;
			canAttack = false;
			//state = moving == true ? REDFROGSTATE.MOVE : REDFROGSTATE.IDLE;
		}
			
	break;
	
	case REDFROGSTATE.HURT:
		sprite_index = Hit;
		state = moving == true ? REDFROGSTATE.MOVE : REDFROGSTATE.IDLE;
	break;
	
	case REDFROGSTATE.DEAD:
		repeat(6) {
			CreateParticle(x, y, "Instances", OBJ_PARTICLE, particle_strip5, irandom(360), 0.4, 0.2, 1, c_white, false);
		}
		instance_destroy();
	break;
}

if(hp <= 0) {
	state = REDFROGSTATE.DEAD;
}
	