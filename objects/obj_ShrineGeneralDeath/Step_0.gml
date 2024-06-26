/// @description 

///Gravitational Movement
ySpeed += Gravity;
Wall_FallOn();
y += ySpeed;

//Set the sprite color to grey
image_blend = make_color_hsv(255, 0, 255);

//Stop the animation at the end
AnimationStopAtEnd();

//If the animation has ended
if (image_speed == 0)
{
	
	if (!ShrineGeneralDeath_EventRun)
	{
	
		#region Old Code
		/*
			//Declare a function for opening the Shrine Arena Exit
			var _newFunc = function()
			{
			
				time_source_destroy(VoizatiaBossIntro_TimeSource);
				VoizatiaBossIntro_TimeSource = noone;
			
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
			
				}//end open Shrine Arena Exit
		
				//start the event to give control back to the player
				if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(60, _otherNewFunc);
			}
	
			//Start the event to open the doors
			if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(60, _newFunc);
		*/
		#endregion
		
		time_source_start(ShrineGeneralDeath_TimeSource);
		
		ShrineGeneralDeath_EventRun = true;
	}
	
}//end animation not playing