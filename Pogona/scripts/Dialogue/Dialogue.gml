function Dialogue(_id, _actor, _sprite, _textArray, _startingPos) constructor {
	id = _id;
	actor = _actor;
	sprite = _sprite;
	textArray = _textArray;
	startingPos = _startingPos;
	currentPos = startingPos;
	
	static create = function(_x, _y) {
		var _dialogue = instance_create_layer(_x, _y, "Text", oDialogue);
		_dialogue.data = self;
	}
	
	return self;
}