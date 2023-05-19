/// @description ParticleTrail (sprite_index, <image_blend>, <FadeRate> , <image_alpha>)
/// @arg sprite_index
/// @arg <image_blend>
/// @arg <image_alpha>
/// @arg <FadeRate>
function ParticleTrail(argument0){

	var _trail = instance_create_depth(x, y, depth + 1, obj_Trail)

	_trail.sprite_index = argument0;
	
	_trail.image_xscale = image_xscale;
	
	//Set the color to the first argument of the function
	if (argument_count > 1) _trail.image_blend = argument0;
	else _trail.image_blend = c_white;
		
	//Set the fate rate to the second argument of the function
	if (argument_count > 2) _trail.FadeRate = argument1;
	else _trail.FadeRate = 0.05;
		
	//Set the starting transparency to the third argument of the function
	if (argument_count > 3) _trail.image_alpha = argument2;
	else _trail.image_alpha = 0.7;
	
}