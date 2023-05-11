/// @description SlideTransition(mode, targetroom)
/// @arg Mode sets transition mode between next, restart, and got.
/// @arg Target sets target room when using the goto mode.

with (obj_Transition) {

	mode = argument[0];
	
	if (argument_count > 1) target = argument[1];
	

}