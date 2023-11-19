/// @description


var _standfunc = function()
{
	//show_debug_message("Awaken A to B");
	image_speed = 1;
	image_index = 0;
	sprite_index = spr_PlayerAwaken_B;
	time_source_destroy(PlayerRise_TimeSource);
	PlayerRise_TimeSource = noone;
}

PlayerRise_TimeSource = TimeSourceCreate(30, _standfunc);;

var _secondstandfunc = function()
{
	//show_debug_message("Awaken B to Real");
		
	global.WarpTargetX = x;
	global.WarpTargetY = y;
	SetSpawnpoint(x, y);
	SummonPlayer(x - (4 * image_xscale), y);
	obj_Player.image_xscale = image_xscale;
	time_source_destroy(PlayerRise_TimeSource2);
	PlayerRise_TimeSource2 = noone;
	instance_destroy();		
}

PlayerRise_TimeSource2 = TimeSourceCreate(30, _secondstandfunc)


