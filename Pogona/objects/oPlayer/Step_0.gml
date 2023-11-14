inputs(); // updates inputs.

//Work out where to move horizontally
hspMove = approach(hspMove, (keyRight-keyLeft) * hspWalk, 0.5);
hsp = hspMove;
 
//Work out where to move vertically
vsp = vsp + grv;
 
//Jumping
canJump-=1;

if(hsp != 0) {
	dir = sign(hsp);	
}

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

fsm.event(TrueStateEvent.onStep);