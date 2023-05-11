/// @description FeralArrow(x, y, direction)
/// @arg x
/// @arg y
/// @arg direction

function FeralArrow(argument0, argument1, argument2) {
	
	with (instance_create_layer(argument0, argument1, layer, obj_FeralArrows))
	{
	
		var Dir = argument2;
		direction = Dir;
		image_angle = Dir;
	
	}

}