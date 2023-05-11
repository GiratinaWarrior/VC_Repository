/// @description SetSpawnpoint(x, y)
/// @arg x
/// @arg y
function SetSpawnpoint(argument0, argument1){

	global.Spawnpoint = room;
	global.SpawnX = argument0;
	global.SpawnY = argument1;
	
	global.WarpTargetX = global.SpawnX;
	global.WarpTargetY = global.SpawnY;

}