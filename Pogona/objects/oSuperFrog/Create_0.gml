direction = 0;
speed = 0;
movetime = 0;
hp = 200;
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