/// @description SetSpawnpoint(x, y, room)
/// @arg x
/// @arg y
/// @arg room
function SetSpawnpoint(_spawnx, _spawny, _spawnroom = room){

	global.Spawnpoint = _spawnroom;
	global.SpawnX = _spawnx;
	global.SpawnY = _spawny;
	
	global.WarpTargetX = global.SpawnX;
	global.WarpTargetY = global.SpawnY;
	
	show_debug_message(room_get_name(global.Spawnpoint));

}