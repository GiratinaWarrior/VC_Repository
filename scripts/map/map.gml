/// @description map(value, current_lower_bound, current_upper_bound, desired_lower_bound, desired_upper_bound)
/// @arg value
/// @arg current_lower_bound
/// @arg current_upper_bound
/// @arg desired_lower_bound
/// @arg desired_upper_bound

function map(argument0, argument1, argument2, argument3, argument4) {
    return (((argument0 - argument1) / (argument2 - argument1)) * (argument4 - argument3)) + argument3;
}