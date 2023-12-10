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
	
	//show_debug_message("TransitionStart Called");
	
	//Check if a room transition is currently occuring
	if (!global.MidTransition)
	{
		global.MidTransition = true; //Confirm that a room transition is occuring
		global.roomTarget = _roomTarget; //Set the target room
		TransitionSequence(_typeOut); //create a transition sequence to transition out
		layer_set_target_room(_roomTarget); //target a different room
		TransitionSequence(_typeIn); //target a different room, and create a transition sequence
		layer_reset_target_room(); //reset the target room
		
	}
	
}

//Change rooms
function TransitionRoom()
{
	//show_debug_message("TransitionRoom Called");
	room_goto(global.roomTarget);
}

//finish the transition by destroying the sequence and resetting global.MidTransition
function TransitionFinished()
{
	layer_sequence_destroy(self.elementID);
	global.MidTransition = false;
	with (obj_Player)
	{
		if !(RoomIsCutscene)
		{
			hascontrol = true;
		}
	}
}

//This function warps the player to another room when it touches a warp object
///@param Room
///@param TargetX
///@param TargetY
///@param ExitSequence
///@param EnterSequence
///@param RoomIsCutscene
function PlayerTransition(_targetRoom, _targetX, _targetY, _exitSeq, _enterSeq, _roomIsCutscene = false, _movingUp = false)
{
	//Access the player object
	with (obj_Player)
	{
		//Take away their control
		if (hascontrol) 
		{
			hascontrol = false;
		}//end take control
		
		//Check if the next room is a cutscene
		RoomIsCutscene = _roomIsCutscene;
		
		if (_movingUp && !global.MidTransition)
		{
			show_debug_message("Moving 'Down'")
			y += 1000;
		}
		
	}//end access player
	
	//Start a transition sequence
	TransitionStart(_targetRoom, _exitSeq, _enterSeq);
	//Set the warp target
	global.WarpTargetX = _targetX;
	global.WarpTargetY = _targetY;
	//set the spawn target
	global.SpawnX = global.WarpTargetX;
	global.SpawnY = global.WarpTargetY;
	
}//end PlayerTransition()