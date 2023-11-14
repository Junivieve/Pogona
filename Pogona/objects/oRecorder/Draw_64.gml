if(ghostRecord) {
	draw_set_color(c_blue);
	draw_circle(40, 10, 5, false);
	draw_set_font(fTextSmall);
	draw_text(60, 10, string(ghostRecordFrames));
}