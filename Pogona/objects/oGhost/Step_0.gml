if(frame < ghostFrames) {
	if(frame == 0) image_alpha = 1;
	frameData = ghostData[| frame];
	x = frameData[? "x"];
	y = frameData[? "y"]
	image_xscale = frameData[? "xscale"];
	sprite_index = frameData[? "sprite"];
	image_index = frameData[? "image"];
	frame++;
} else {
	image_alpha = max(image_alpha-0.0025, 0);
	if(image_alpha == 0) {
		frame = 0;	
	}
}