/// @description Knockback(power, direction, <upward force>)
/// @arg power
/// @arg direction
/// @arg <upward force>
	//This function applies knockback to an entity when called
	//power refers to the launch force
	//direction refers to the direction knockback is applied to
	//upward force refers to the upward force applied to the object
		//used for the arc effect
	
	
function Knockback(argument0, argument1){

	var _upforce = 0;
	
	if (argument_count > 2) _upforce = argument2;

	xSpeed = lengthdir_x(argument0, argument1);
	ySpeed = lengthdir_y(argument0, argument1) - _upforce;
	

}