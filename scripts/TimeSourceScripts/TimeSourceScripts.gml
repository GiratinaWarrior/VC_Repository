//This function creates a time source using the game parent time source and the frames unit, whatever those mean
///@param Period is how long it takes the time source to activate
///@param Function is the function that is called
///@param Arguments are the arguments for the function
///@param Repetitions is the number of times the time source is repeated
function TimeSourceCreate(_period, _func, _args = [], _reps = 1){
	
	var _newTimeSource =  time_source_create(time_source_game, _period, time_source_units_frames, _func, _args, _reps)

	return _newTimeSource;
}

//This function creates a time source and starts it immediately
///@param Period is how long it takes the time source to activate
///@param Function is the function that is called
///@param Arguments are the arguments for the function
///@param Repetitions is the number of times the time source is repeated
function TimeSourceCreateAndStart(_period, _func, _args = [], _reps = 1)
{
	var _newTimeSource = TimeSourceCreate(_period, _func, _args, _reps);
	
	time_source_start(_newTimeSource);
	
}