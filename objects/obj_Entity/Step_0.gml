/// @description Insert description here
// You can write your code in this editor

#region Text 

//If the player is present
if (instance_exists(obj_Player))
{

	//If the player is within talking range
	if (point_in_circle(obj_Player.x, obj_Player.y, x, y, TalkRange)) 
	{
	
		//If the player talks to the NPC with the talk button
		if (mouse_check_button_pressed(mb_right)){
		
			//If a textbox hasn't been created yet
			if (myTextbox = noone)
			{
				
				with (obj_Player)
				{
					hascontrol = false;
				}
				
				//Create a new textbox 
				myTextbox = instance_create_depth(x, y, -999, obj_Text);
				
				//access myTextbox
				with (myTextbox)
				{
					//TextArgArray = other.DialogueArray;
					TextBox_Text = other.TextBox_Text;
				}//end access myTextbox
				
				
				//Have the camera follow the NPC
				with (obj_Camera)
				{
					follow = other.id;
				}
				
			}//if a textbox hasn't been created
		
		}//end mouse right button pressed
	
	}//end if nearby

	//If the player isnt in talking range
	else 
	{
		//If a textbox exists, destroy it, the reset the player to normal
		if (myTextbox != noone)
		{
			instance_destroy(myTextbox);
			myTextbox = noone;
			obj_Camera.follow = obj_Player;
			obj_Player.hascontrol = true;
		}//end if textbox exists
	
	}//end if not in talking range

}//end if Player not present

#endregion