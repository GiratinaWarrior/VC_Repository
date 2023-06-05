/// this function is an empty function that does nothing
function EmptyFunction(){

}

//////////This function creates one instance of a sequence, then destroys it when its finished
/// @param sequence refers to the sequence in question
/// @param x
/// @param y
/// @param createfunc is the function called when the sequence is created
/// @param destroyfunc is the function called when the sequence is destroyed
function CreateThenDestroySequence(_seq = noone, _x = 0, _y = 0, _createfunc = EmptyFunction, _destroyfunc = EmptyFunction)
{
	
	var _seqid = noone;
	
	//Check if the sequence has already been created, and if not, create the sequence
	if (!layer_sequence_exists(layer, _seqid))
	{
		_seqid = layer_sequence_create(layer, _x, _y, _seq);
		_createfunc();
	}//end create sequence
	
	//if the sequence has already been created
	else
	{
		//if the sequence is finished, destroy it
		if (layer_sequence_is_finished(_seqid))
		{
			layer_sequence_destroy(_seqid);
			_destroyfunc();
		}//end destroy sequence when finished
		
	}//end if sequence created
	
}//end CreateThenDestroySequence