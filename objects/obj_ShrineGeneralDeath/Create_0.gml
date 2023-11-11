/// @description Reset room audio, stop player movement

ySpeed = 0;
Gravity = 0.3;

SetRoomAudio_Music(blanksound);

with (obj_Player)
{
	hascontrol = false;
	move = 0;
	image_xscale = sign(other.x - x);
}

ShrineGeneralDeath_EventRun = false;
//Declare a function for opening the Shrine Arena Exit
var _newFunc = function()
{
	
			
	//Make the exit visible
	layer_set_visible("Floortiles_FullOpen", true);
	layer_set_visible("Floortiles_Closed", false);
	//Destroy the entrance and exit walls
	with (obj_ShrineArenaBossIntroCutscene)
	{
		instance_destroy(ShrineArena_EntranceWall);
		instance_destroy(ShrineArena_ExitWall);
		instance_destroy();
	}
		
	time_source_destroy(ShrineGeneralDeath_TimeSource);
	ShrineGeneralDeath_TimeSource = noone;
		
	//start the event to give control back to the player
	time_source_start(ShrineGeneralDeath_TimeSource1);
}

//Declare a function for giving the player the ability to move again
var _otherNewFunc = function()
{
			
	//Tell the game that the Shrine General has been defeated
	global.ShrineGeneral_Defeated = true;
				
	SetRoomAudio_Music_Default(music_ShrinePeacefulTheme);
				
	SaveGame();
			
	//Acces the player regrant the ability to move again, and have the camera follow
	with (obj_Player)
	{
		//Give control back
		hascontrol = true;
				
		//have the camera follow them
		with (obj_Camera)
		{
			follow = other;
		}
				
	}//end access Player
	
	time_source_destroy(ShrineGeneralDeath_TimeSource1);
	ShrineGeneralDeath_TimeSource1 = noone;
			
}//end open Shrine Arena Exit

ShrineGeneralDeath_TimeSource1 = TimeSourceCreate(20, _otherNewFunc);;

ShrineGeneralDeath_TimeSource = TimeSourceCreate(60, _newFunc);