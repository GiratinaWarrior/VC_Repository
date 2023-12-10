/// @description If the talk button is pressed

//If the talk button is pressed
if (global.Key_Talk)
{
	//If the text has finished typing itself
	if (TextBox_CharCount >= string_length(TextBox_Text[TextBox_Page]))
	{
		
		//If there is another page of text to display, move to the next page	
		if (TextBox_Page + 1 < array_length(TextBox_Text)){
			TextBox_Page++;
			TextBox_CharCount = 0;
		}//end move to next page
		
		//If the dialogue is finished
		else
		{
			instance_destroy(); //Destroy the text object
			
			audio_stop_sound(TextBox_Voices[TextBox_Page]);
			
			//If this textbox was not created for a cutscene
			if (!TextBox_Cutscene)
			{
				//Give the player control back
				with (obj_Player)
				{
					hascontrol = true;
				}//end give player control
			
		
				//Make the camera follow the player
				obj_Camera.follow = obj_Player; 
			
				//Access the entity who summoned to text
				with (obj_Entity)
				{
					//Set the NPC's textbox to noone
					if (!alarm[1])
					{
						alarm[1] = 1;
					}
				}//end access entity
			
			}//end cutscene text
			
		}//end dialogue finished
		
	}//end text done typing
	
	//If the text hasn't finished typing itself
	else if (TextBox_CharCount > 1) && (TextBox_TextSkippable)
	{
		TextBox_CharCount = string_length(TextBox_Text[TextBox_Page]);
		//TextBox_TalkSpeed = 3;
	}
	else
	{
		//TextBox_TalkSpeed = 1;
	}
	
}//end talk button pressed

else
{
	TextBox_TalkSpeed = 1;
}