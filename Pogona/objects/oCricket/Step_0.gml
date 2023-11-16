if(place_meeting(x, y, oPlayer)) {
	if(myTextBox == noone) {
		myTextBox = instance_create_layer(dialogue.defaultX, dialogue.defaultY, "Text", oDialogue);
		myTextBox.text = dialogue.textArray[dialogue.currentPos];
	}
} else {
	if(myTextBox != noone) {
		instance_destroy(myTextBox);
		myTextBox = noone;
	}
}

vsp += grv;

if(place_meeting(x, y+1, oBox)) {
	vsp -= 0.5;	
}

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