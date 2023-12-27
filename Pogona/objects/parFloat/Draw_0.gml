draw_sprite(sStarburst, frame, x, y);
frame += 0.1;
if(frame > 3) {
	frame = 0;	
}
draw_self();