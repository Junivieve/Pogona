direction = 0;
speed = 0;
movetime = 0;
hp = 2;
enum FROGSTATE {
	IDLE,
	MOVE,
	ATTACK,
	HURT,
	DEAD
}
canAttack = true;
moving = true;
state = FROGSTATE.MOVE;
guard = false;