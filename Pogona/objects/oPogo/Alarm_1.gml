/// @description restart at checkpoint

var _check=-1
with(objCheckpoint){if active{_check=id}}//see if any checkpoints are activated
if _check=-1{room_restart()}// no active checkpoint? just restart the room
else{
	x=_check.x //move player to active checkpoint
	y=_check.y-16 //move player to active checkpoint
	stateSet(STATE_IDLE)//set state
	resetStats()//reset various stats
	visible=true//visible again :D
}
