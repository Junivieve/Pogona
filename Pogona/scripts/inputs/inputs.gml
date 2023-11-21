function inputs() {
	keyRight = keyboard_check(vk_right);
	keyLeft = keyboard_check(vk_left);
	keyJump = keyboard_check_pressed(ord("X"));
	keyShoot = keyboard_check_pressed(ord("Z"));
	keyDash = keyboard_check_pressed(ord("C"));
}