/// @description SummonPlayer(x, y);
/// This function creates an instance of the player object if it doesn't already exist
function SummonPlayer(_x = x, _y = y){
	
	if (layer_exists("Player"))
	{
		var _layer = "Player";
	}
	else
	{
		var _layer = layer;
	}
	
	if (!instance_exists(obj_Player))
	{

		instance_create_layer(_x, _y, _layer, obj_Player);
			
	}
}

/// @description SetSpawnpoint(x, y, room)
/// This function sets the players spawnpoint so that when they die or close the game, they will respawn in the correct room
function SetSpawnpoint(_x = global.WarpTargetX, _y = global.WarpTargetY, _room = room)
{
	
	global.Spawnpoint = _room;
	
	global.SpawnX = _x;
	global.SpawnY = _y;
	
	
}