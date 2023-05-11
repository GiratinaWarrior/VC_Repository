SetSpawnpoint(64, 608);

global.Health = 10;

with (obj_PlayBGM)
{
	NextBGM = music_FieldTownTheme;
}

with (obj_PlayBGS)
{
	NextBGS = global.FieldSound;
}

SaveGame();