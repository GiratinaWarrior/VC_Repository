/// @description Insert description here
// You can write your code in this editor

with (obj_Player)
{
	hascontrol = false;
}

if (mouse_check_button_pressed(mb_right))
{
	if (Page + 1 < array_length(Text)){
		Page++;
		CharCount = 0;
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