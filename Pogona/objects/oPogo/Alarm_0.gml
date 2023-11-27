/// @description death effect
alarm[1]=30

#region death effect
for(var i=0; i<360; i+=36){
	var _b=instance_create_depth(x,y+8,depth,objDeathBall)
	_b.direction=i
	_b.image_angle=i
}
audio_play_sound(sndDie2,1,0)
visible=false//we just hide the player for a little while
#endregion

