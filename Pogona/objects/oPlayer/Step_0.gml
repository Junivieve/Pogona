fsm.event(TrueStateEvent.onStep);
if(fsm.current.id != PLAYERSTATE.EGG && fsm.current.id != PLAYERSTATE.HATCH) {
	inputs(); // updates inputs.
	//Work out where to move horizontally
	hspMove = approach(hspMove, (keyRight-keyLeft) * hspWalk, 0.5);
	hsp = hspMove;
}

//Work out where to move vertically
if(onAWall != 0) {
	vsp = min(vsp+grv, 0.8);	
} else {
	vsp += grv;
}

//Jumping
canJump-=1;
if(hsp != 0) {
	dir = sign(hsp);	
}

onTheGround = place_meeting(x, y + 1, oBox);
onAWall = place_meeting(x-5, y, oBox) - place_meeting(x+5, y, oBox);

//Horizontal move & collide
#region //Collide and move
//Horizontal Collision
if (place_meeting(x+hsp,y,oBox))
{
	while (!place_meeting(x+sign(hsp),y,oBox))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oBox))
{
	while (!place_meeting(x,y+sign(vsp),oBox))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;
#endregion

