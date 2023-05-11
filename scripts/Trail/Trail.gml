/// @description Trail(<image_blend>, <FadeRate> , <image_alpha>)
/// @arg <image_blend>
/// @arg <image_alpha>
/// @arg <FadeRate>
function Trail(){

	
	//Create an instance of a Trail object behind the current object
	with (instance_create_depth(x, y, depth + 1, obj_Trail))
	{
		//Set the sprites to be the same
		sprite_index = other.sprite_index;
		
		//Set the color to the first argument of the function
		if (argument_count > 0) image_blend = argument0;
		else image_blend = c_white;
		
		//Set the fate rate to the second argument of the function
		if (argument_count > 1) FadeRate = argument1;
		else FadeRate = 0.05;
		
		//Set the starting transparency to the third argument of the function
		if (argument_count > 2) image_alpha = argument2;
		else image_alpha = 0.7;
		
	}//end create Trail instance

}//end Trail();