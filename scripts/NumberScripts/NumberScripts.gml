/// @description Approach(a, b, amount)
/// @arg a
/// @arg b
/// @arg amount

// Moves "a" towards "b" by "amount" and returns the result
// Nice bcause it will not overshoot "b", and works in both directions
// Examples:
//      speed = Approach(speed, max_speed, acceleration);
//      hp = Approach(hp, 0, damage_amount);
//      hp = Approach(hp, max_hp, heal_amount);
//      x = Approach(x, target_x, move_speed);
//      y = Approach(y, target_y, move_speed);


function Approach(argument0, argument1, argument2)
{

	if (argument0 < argument1)
	{
	    argument0 += argument2;
	    if (argument0 > argument1)
	        return argument1;
	}
	else
	{
	    argument0 -= argument2;
	    if (argument0 < argument1)
	        return argument1;
	}
	return argument0;

}




/// @description map(value, current_lower_bound, current_upper_bound, desired_lower_bound, desired_upper_bound)
/// @arg value
/// @arg current_lower_bound
/// @arg current_upper_bound
/// @arg desired_lower_bound
/// @arg desired_upper_bound

function map(argument0, argument1, argument2, argument3, argument4) {
    return (((argument0 - argument1) / (argument2 - argument1)) * (argument4 - argument3)) + argument3;
}




/// @description Wave (first_boundary, second_boundary, speed, offset)
/// @arg first_boundary
/// @arg second_boundary
/// @arg speed
/// @arg offset

//Wave(from, to, duration, offset)
 
// Returns a value that will wave back and forth between [from-to] over [duration] seconds
// Examples
//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
// Or here is a fun one! Make an object be all squishy!! ^u^
//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
 
function Wave(argument0, argument1, argument2, argument3 = 0)
{
 
a4 = (argument1 - argument0) * 0.5;
return argument0 + a4 + sin((((current_time * 0.001) + argument2 * argument3) / argument2) * (pi*2)) * a4;

}


/// @description Chance(percent)
/// @param percent
 
// Returns true or false depending on RNG
// ex: 
//      Chance(0.7);    -> Returns true 70% of the time
 
function Chance(argument0)
{
	return argument0 > random(1);
}






