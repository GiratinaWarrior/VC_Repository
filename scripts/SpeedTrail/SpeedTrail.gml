/// @description SpeedTrail(<image_blend>, <FadeRate> , <image_alpha>)
/// @param color
/// @oaram fadeOut
/// @param fadeStart
function SpeedTrail(_color = c_white, _fade = 0.05, _trans = 0.7){

	//Create an instance of a Trail object behind the current object
	with (instance_create_depth(x, y, depth + 1, obj_Trail))
	{
		//Set the sprites to be the same
		sprite_index = other.sprite_index;
		
		image_xscale = other.image_xscale;
		
		//Set the color to the first argument of the function
		if (argument_count > 0) image_blend = argument0;
		else image_blend = _color;
		
		//Set the fate rate to the second argument of the function
		if (argument_count > 1) FadeRate = argument1;
		else FadeRate = _fade;
		
		//Set the starting transparency to the third argument of the function
		if (argument_count > 2) image_alpha = argument2;
		else image_alpha = _trans;
		
	}//end create Trail instance

}//end Trail();