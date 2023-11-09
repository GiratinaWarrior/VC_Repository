/// @description Insert description here
// You can write your code in this editor

if (sprite_index == spr_PlayerAwaken_A)
{
	//show_debug_message("Awaken A: Playing");
	AnimationStopAtEnd();

	if (image_speed == 0)
	{
		time_source_start(PlayerRise_TimeSource);
	}
}
else if (sprite_index == spr_PlayerAwaken_B)
{
	//show_debug_message("Awaken B: Playing");
	AnimationStopAtEnd();
	
	if (image_speed == 0)
	{
		time_source_start(PlayerRise_TimeSource2);
	}
}






