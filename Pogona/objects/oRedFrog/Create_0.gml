direction = 0;
speed = 0;
movetime = 0;
hp = 4;
enum REDFROGSTATE {
	IDLE,
	MOVE,
	ATTACK,
	HURT,
	DEAD
}
canAttack = true;
moving = true;
state = REDFROGSTATE.MOVE;