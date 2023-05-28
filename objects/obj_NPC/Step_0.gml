/// @description Insert description here
// You can write your code in this editor

#region Gravity

y = y + ySpeed;

if (place_meeting(x, y + ySpeed, obj_WallPlatform)){
	
	while(!place_meeting(x, y + sign(ySpeed), obj_WallPlatform))
	{
		y = y + sign(ySpeed);
	}
	
	ySpeed = 0;
}

if (CanFloat == 1)
{
	y += bouncespeed;

	if (y >= midpoint + amplitude) || (y <= midpoint - amplitude) 
	{
		bouncespeed *= -1;
	}
}

x += walkspeed;

if (x >= middlepoint + distlimit) || (y <= middlepoint - distlimit)
{
	walkspeed *= -1;
}

if (walkspeed != 0)
{
	
	image_xscale = -sign(walkspeed);
	
}

if (place_meeting(x + walkspeed, y, obj_WallPlatform)){
	
	while(!place_meeting(x + sign(walkspeed), y, obj_WallPlatform))
	{
		x = x + sign(walkspeed);
	}

	walkspeed *= -1;

}


image_angle += SpinSpeed;

#endregion

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
				
				//Access tthe new textbox
				with (myTextbox)
				{
					//Set the text to be the NPC's Speech
					TextBox_Text = other.Speech;
					
					//If the NPC has a name, add the name to their speech
					if (other.Name != "" && other.NameInserted == false) 
					{
						for (var i = 0; i < array_length(TextBox_Text); i++)
						{
							TextBox_Text[i] = other.Name + ": " + TextBox_Text[i];
						}
						other.NameInserted = true;
						
					}//end if NPC has name
					
				}//end access textbox
				
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
		if (myTextbox != noone)
		{
			instance_destroy(myTextbox);
			myTextbox = noone;
			obj_Camera.follow = obj_Player;
			obj_Player.hascontrol = true;
		}
	
		CanFloat = PauseFloat;
	
	}

}

#endregion