// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.MidTransition = false;
global.roomTarget = -1;

//Create the sequence and place it in the room
function TransitionSequence(_type){

	if (layer_exists("transition")) layer_destroy("transition");
	var _lay = layer_create(-9999, "transition");
	layer_sequence_create(_lay, 0, 0, _type);

}

//Transition to another room, using sequences of choice
function TransitionStart(_roomTarget, _typeOut, _typeIn)
{
	//Check if a room transition is currently occuring
	if (!global.MidTransition)
	{
		global.MidTransition = true; //Confirm that a room transition is occuring
		global.roomTarget = _roomTarget; //Set the target room
		TransitionSequence(_typeOut); //create a transition sequence to transition out
		layer_set_target_room(_roomTarget); //target a different room
		TransitionSequence(_typeIn); //target a different room, and create a transition sequence
		layer_reset_target_room(); //reset the target room
		return true;
	}
	else return false;
}

//Change rooms
function TransitionRoom()
{
	room_goto(global.roomTarget);
}

//finish the transition by destroying the sequence and resetting global.MidTransition
function TransitionFinished()
{
	layer_sequence_destroy(self.elementID);
	global.MidTransition = false;
}