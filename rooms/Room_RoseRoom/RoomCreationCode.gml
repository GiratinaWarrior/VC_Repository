with (obj_PlayBGM)
{
	NextBGM = music_ShrineMemoryTheme; 
}

with (obj_PlayBGS)
{
	NextBGS = blanksound;
}

SummonPlayer(128, 128);
SetSpawnpoint();
SaveGame();