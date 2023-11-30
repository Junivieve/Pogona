direction = 0;
speed = 0;
movetime = 0;
enum FROGSTATE {
	IDLE,
	MOVE,
	ATTACK
}
canAttack = true;
state = FROGSTATE.MOVE;