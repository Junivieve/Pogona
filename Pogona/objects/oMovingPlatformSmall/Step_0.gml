/// @description Inserte aquí la descripción
//Select target
var _targetX = endX, _targetY = endY;
if (goingToStart) {
	_targetX = startX;
	_targetY = startY;
}

//Set Movement
hspd = sign(_targetX - x) * currentSpeed;
vspd = sign(_targetY - y) * currentSpeed;