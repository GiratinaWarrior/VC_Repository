/// @description If the talk button is pressed

//If the talk button is pressed
if (mouse_check_button_pressed(mb_right))
{
	//If there is another page of text to display, move to the next page
	if (TextBox_Page + 1 < array_length(TextBox_Text)){
		TextBox_Page++;
		TextBox_CharCount = 0;
	}
	//If the dialogue is finished
	else
	{
		instance_destroy(); //Destroy the text object
		//Give the player control back
		with (obj_Player)
		{
			hascontrol = true;
		}
		obj_Camera.follow = obj_Player;
		with (obj_NPC)
		{
			alarm[1] = 1;
			CanFloat = PauseFloat;
			walkspeed = PauseRun;
			//TalkedTo++;
		}
	}
	
}