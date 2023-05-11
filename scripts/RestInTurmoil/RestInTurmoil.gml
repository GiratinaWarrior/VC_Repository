/// @description RestInTurmoil(x, y, speed)
/// @arg x
/// @arg y
/// @arg speed

function RestInTurmoil(argument0, argument1, argument2){

	//create Rest In Turmoil
	with(instance_create_layer(argument0, argument1, layer, obj_RestInTurmoil))
	{
		ySpeed = argument2;
	}
	
}