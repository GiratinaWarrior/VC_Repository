// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NPC_Movement(){

#region Movement

	Wall_FallOn();
	Wall_SwitchRun();

	x = Wave(distlimit, -distlimit, xSpeed);

	if (xSpeed != 0)
	{
		image_xscale = -sign(xSpeed);
	}

	if (CanFloat == 1)
	{	
		y = Wave(amplitude, -amplitude, bouncespeed);
	}
	else
	{
		y += ySpeed;
	}

	image_angle += SpinSpeed;

#endregion

}

/// @description EntityTextBox()
/* 
This function handles the entity text box code where when the player interacts with it,
a textbox is created for that individual entity
This function can also be given functions as arguments that can be run before the text code
*/
function EntityTextBox()
{
	
	if (argument_count > 0)
	{
		for (var a = 0; a < argument_count; a++)
		{
			var func = argument[a];
			func();
		}
	}
	
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
						TextBox_Text = other.TextBox_Text;
						if (other.Name != "" && !other.NameInserted)
						{
							for (var n = 0; n < array_length(TextBox_Text); n++)
							{
								TextBox_Text[n] = Name + ": " + TextBox_Text[n];
							}
							other.NameInserted = true;
						}
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
	
}