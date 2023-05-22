/// @description TimeSource (time, function, args, reps)
/// @arg time is for how long it takes for the time source to activate the function after being called
/// @arg function is the function that is called when the time source is finished
/// @arg args is the arguments that are to be passed into the function, none by default
/// @arg reps is how many times the time source is repeated, once by default

function TimeSource(_time, _function, _args = [], _reps = 1){

	var _newTimeSource = time_source_create(time_source_game, _time, time_source_units_frames, _function, _args, _reps)

	return _newTimeSource;

}