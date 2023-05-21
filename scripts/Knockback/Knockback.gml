/// @description Knockback(power, direction)
/// @arg power
/// @arg direction
/// @arg upward force
	//This function applies knockback to an entity when called
	//power refers to the launch force
	//direction refers to the direction knockback is applied to
	//upward force refers to the upward force applied to the object
		//used for the arc effect
	
	
function Knockback(_power, _dir, _upforce = 0){

	xSpeed = lengthdir_x(_power, _dir);
	ySpeed = lengthdir_y(_power, _dir) - _upforce;
	
}