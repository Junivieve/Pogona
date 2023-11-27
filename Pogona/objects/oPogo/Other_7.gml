/// @description sprite swapping

//There are a few sprites where we need to take action at the end of thier animation
//we can do all of that here


//when we die, we dont want to keep playing the animation, so we 
//set image speed to 0
if sprite_index=spriteDead{
	image_speed=0
	image_index=4
}

#region waiting / idle sprites
if sprite_index=spriteIdle{
	if random(100)>50{
		spriteSet(spriteIdleBlink)
		exit
	}
}


if sprite_index=spriteWait1{
	if random(100)>50{
		spriteSet(choose(spriteWait2,spriteWait3))
		exit
	}
}

if sprite_index=spriteWait2{
	if random(100)>50{
		spriteSet(choose(spriteWait1,spriteWait3))
		exit
	}
}

if sprite_index=spriteWait3{
	spriteSet(spriteWait1)
	exit
}


if sprite_index=spriteIdleBlink{
		spriteSet(spriteIdle)
		exit
}
#endregion

//never ended up using this, but the state exists, so lets leave it here
//incase we end up using it later
if sprite_index=spriteHurt{
	stateSet(STATE_FALL)
}

