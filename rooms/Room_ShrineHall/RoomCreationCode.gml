with (obj_PlayBGM)
{
	NextBGM = music_ShrineMemoryTheme; 
}

with (obj_PlayBGS)
{
	NextBGS = blanksound;
}

SaveGame();
SetSpawnpoint(1920, 512, Room_ShrineHall);
show_debug_message("Shrine Hall Set Spawnpoint")