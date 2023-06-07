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

///This function takes an object and overrides it with a sequence, the sequence is destroyed upon ending
/// @param object is the object to turn into a sequence
/// @param sequence is the sequence that overrides the object
/// @param x
/// @param y
/// @param layer
/// @param finishfunc is the function that is called when the sequence finished
function TurnObjectToSequence(_obj, _seq, _x = x, _y = y, _layer = layer, _finishfunc = EmptyFunction)
{
	
	var _elm = noone;
	var _id = noone;
	
	var _seqCreate = false;
	
	if (!_seqCreate)
	{
		//Create the sequence element and id
		 _elm = layer_sequence_create(_layer, _x, _y, _seq);
		 _id = layer_sequence_get_instance(_elm);
		 //Sequence overrides object
		sequence_instance_override_object(_id, _obj, instance_find(_obj, 0));
		 _seqCreate = true;
	}

	else
	{
		
		show_debug_message("ELSESES");
		
		//If the sequence has finished playing
		if (layer_sequence_is_finished(_elm))
		{

			layer_sequence_destroy(_elm);
			sequence_destroy(_id);
			_finishfunc();
		}//end sequence finished
	}
		
}//end TurnObjectToSequence()