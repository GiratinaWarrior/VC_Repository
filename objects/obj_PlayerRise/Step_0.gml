/// @description Insert description here
// You can write your code in this editor

if (sprite_index == spr_PlayerAwaken_A)
{
	//show_debug_message("Awaken A: Playing");
	AnimationStopAtEnd();
	var _standfunc = function()
	{
		//show_debug_message("Awaken A to B");
		image_speed = 1;
		image_index = 0;
		sprite_index = spr_PlayerAwaken_B;
	}
	if (image_speed == 0)
	{
		TimeSourceCreateAndStart(30, _standfunc);
	}
}
else if (sprite_index == spr_PlayerAwaken_B)
{
	//show_debug_message("Awaken B: Playing");
	AnimationStopAtEnd();
	var _standfunc = function()
	{
		//show_debug_message("Awaken B to Real");
		
		global.WarpTargetX = x;
		global.WarpTargetY = y;
		SetSpawnpoint(x, y);
		SummonPlayer(x, y);
		obj_Player.image_xscale = image_xscale;
		instance_destroy();		
		
	}
	if (image_speed == 0)
	{
		TimeSourceCreateAndStart(30, _standfunc);
	}
}






