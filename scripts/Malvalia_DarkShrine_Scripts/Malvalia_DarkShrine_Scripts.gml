// Auto-generated stubs for each available event.

function SequenceFunction_MalvaliaBossBattle_Teleport()
{
	with (obj_Malvalia_FirstFight)
	{
		x = Malvalia_FirstFight_Teleport_TargetX;
		y = Malvalia_FirstFight_Teleport_TargetY;
	}
}

/// @desc Malvalias Teleport function
/// @param X
/// @param Y
/// @param Function
function MalvaliaBossBattle_Teleport(_targetX, _targetY, _func = function(){Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.IDLE;})
{
	if !(layer_sequence_exists(layer, Malvalia_FirstFight_Teleport_Sequence))
	{
		//Create the sequence
		Malvalia_FirstFight_Teleport_Sequence = layer_sequence_create(layer, x, y, seq_MalvaliaBossBattle_Teleport);
		//Get the instance id
		Malvalia_FirstFight_Teleport_SequenceInstance = layer_sequence_get_instance(Malvalia_FirstFight_Teleport_Sequence);
		//Override the sequence
		sequence_instance_override_object(Malvalia_FirstFight_Teleport_SequenceInstance, obj_Malvalia_FirstFight, id);
		//Set the target coordinates
		Malvalia_FirstFight_Teleport_TargetX = _targetX;
		Malvalia_FirstFight_Teleport_TargetY = _targetY;
	}
	//If the sequence is finished
	else if (layer_sequence_is_finished(Malvalia_FirstFight_Teleport_Sequence))
	{
		layer_sequence_destroy(Malvalia_FirstFight_Teleport_Sequence);
		Malvalia_FirstFight_Teleport_Sequence = noone;
		Malvalia_FirstFight_Teleport_SequenceInstance = noone;
		Malvalia_FirstFight_Teleport_SequenceCreated = false;
		Malvalia_FirstFight_Teleport_Timer = 0;
		_func();
	}
}

/// @desc Malvaliss Black Geyser function
/// @param X
/// @param Y
function MalvaliaBossBattle_BlackGeyser(_x, _y)
{
	
	if (room == Room_DarkShrineMalvaliaArena && instance_exists(obj_Malvalia_FirstFight))
	{
		if (obj_Malvalia_FirstFight.Health > 0) instance_create_layer(_x, room_height, "Black_Geyser", obj_BlackGeyser);
	}
	//show_debug_message("GEYSER");
}

/// @desc Malvalias Red Needles function
function MalvaliaBossBattle_RedNeedles(_dir, _speed)
{
	//Create a Red Needles
	with(instance_create_layer(x, y, "Red_Needles", obj_RedNeedles))
	{
		speed = _speed;
		direction = _dir;
		image_angle = direction;
	}
	
}