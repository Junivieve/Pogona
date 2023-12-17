direction = 0;
speed = 0;
movetime = 0;
hp = 200;
hp_max = hp;

healthbar_width = 279;
healthbar_height = 8;
healthbar_x = (480/2) - (healthbar_width/2);
healthbar_y = 19;

enum BIGFROGSTATE {
	IDLE,
	MOVE,
	ATTACK,
	HURT,
	DEAD
}
canAttack = true;
moving = true;
state = BIGFROGSTATE.MOVE;