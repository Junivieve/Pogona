switch(state) {
	case FROGSTATE.IDLE:
		sprite_index = Idle;
		speed = 0;
		if(point_distance(x, y, oPogo.x, oPogo.y) < 32) {
			if(canAttack) {
				state = FROGSTATE.ATTACK;	
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
	case FROGSTATE.MOVE: 
		movetime -= 0.01 * global.gameTime;
		y += 1.6;
		if(movetime <= 0) {
			speed = speed == 0 ? 1 : 0;
			movetime = 3;
		}

		image_xscale = direction == 0 ? 1 : -1;

		switch(speed) {
			case 0:
				sprite_index = Idle;
			break;
	
			case 1:
				sprite_index = Jump;
			break;
		}
		if(point_distance(x, y, oPogo.x, oPogo.y) < 32) {
			if(canAttack) {
				state = FROGSTATE.ATTACK;	
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
	
	case FROGSTATE.ATTACK:
		sprite_index = Attack;
		
		if(image_index >= image_number-1) {
			state = FROGSTATE.MOVE;	
			movetime = 3;
		}
		
		if(place_meeting(x, y, oPogo)) {
			oPogo.state = STATE_HURT;
			oPogo.hp --;
		}
			
	break;
	
	case FROGSTATE.HURT:
		sprite_index = Hit;
		state = moving == true ? FROGSTATE.MOVE : FROGSTATE.IDLE;
	break;
	
	case FROGSTATE.DEAD:
		repeat(6) {
			CreateParticle(x, y, "Instances", OBJ_PARTICLE, particle_strip5, irandom(360), 0.4, 0.2, 1, c_white, false);
		}
		instance_destroy();
	break;
}

if(hp <= 0) {
	state = FROGSTATE.DEAD;
}
	