vspd = spd * dir;

if(y <= ystart-dist) {
	dir = 1;	
}

if(y >= ystart+dist) {
	dir = -1;	
}

x += hspd;
y += vspd;