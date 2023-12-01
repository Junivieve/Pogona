switch(oPogo.tutorial) {
	case 0:
		tutorial = "movement_tutorial.mp4";
	break;

	case 1:
		tutorial = "frog_tutorial.mp4";
	break;
	
	case 2:
		tutorial = "scales_tutorial.mp4";
	break;
	
	case 3:
		tutorial = "dash_tutorial.mp4";
	break;

	case 4:
		tutorial = "climb_tutorial.mp4";
	break;
}

video_open(tutorial);