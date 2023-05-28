/// @description If the talk button is pressed

//If the talk button is pressed
if (mouse_check_button_pressed(mb_right))
{
	if (TextBox_Page + 1 < array_length(TextBox_Text)){
		TextBox_Page++;
		TextBox_CharCount = 0;
	}
	else
	{
		instance_destroy();
		obj_NPC.alarm[1] = 1;
		obj_Player.hascontrol = true;
		obj_Camera.follow = obj_Player;
		with (obj_NPC)
		{
			CanFloat = PauseFloat;
			walkspeed = PauseRun;
			TalkedTo++;
		}
	}
}