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
	//Declare a function for opening the Shrine Arena Exit
	var _newFunc = function()
	{
		//Make the exit visible
		layer_set_visible("Floortiles_FullOpen", true);
		layer_set_visible("Floortiles_Closed", false);
		//Destroy the entrance and exit walls
		instance_destroy(obj_ShrineArenaBossIntroCutscene.ShrineArena_EntranceWall);
		instance_destroy(obj_ShrineArenaBossIntroCutscene.ShrineArena_ExitWall);
		
		//Declare a function for giving the player the ability to move again
		var _otherNewFunc = function()
		{
			
			//Tell the game that the Shrine General has been defeated
			global.ShrineGeneral_Defeated = true;
			
			//Acces the player regrant the ability to move again, and have the camera follow
			with (obj_Player)
			{
				//Give control back
				hascontrol = true;
				
				//have the camera follow them
				with (obj_Camera)
				{
					follow = other.id;
				}
				
			}//end access Player
			
		}//end open Shrine Arena Exit
		
		//start the event to give control back to the player
		TimeSourceCreateAndStart(60, _otherNewFunc);
	}
	
	//Start the event to open the doors
	TimeSourceCreateAndStart(60, _newFunc);
	
}//end animation not playing