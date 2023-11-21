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
//onAWall = place_meeting(x-5, y, oBox) - place_meeting(x+5, y, oBox);
var _atLedge = false;

//Horizontal move & collide
#region //Collide and move
//Horizontal Collision
if (place_meeting(x+hsp,y,oBox))
{
	
	var _horiWall = instance_place(x+hsp, y, oBox);
	if(!position_meeting((sign(hsp) == 1) ? _horiWall.bbox_left : _horiWall.bbox_right, _horiWall.bbox_top-1, oBox)) {
		_atLedge = true;
		var _ledgeAboveOrBelow = sign(oPlayer.bbox_top-_horiWall.bbox_top);
	}
	
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

if(_atLedge && _ledgeAboveOrBelow != sign(oPlayer.bbox_top-_horiWall.bbox_top)) {
	y = _horiWall.bbox_top+sprite_get_yoffset(sprite_index);
	fsm.stateSwitch(PLAYERSTATE.LEDGE);
}
#endregion
