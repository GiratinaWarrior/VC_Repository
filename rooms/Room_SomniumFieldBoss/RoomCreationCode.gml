with (obj_PlayBGM) 
{
	NextBGM = blanksound;//music_BossTheme;
}

global.Spawnpoint = Room_SomniumFieldTown;

with (obj_PlayBGS)
{
	NextBGS = blanksound;
}

with (obj_Camera)
{
	follow = noone;
}

//SetSpawnpoint(989, 512);
SaveGame();