global.Spawnpoint = Room_TundraTown;
global.SpawnX = room_width - 32;
global.SpawnY = 544;

with (obj_PlayBGM)
{
	NextBGM = music_TundraTownTheme;
}

with (obj_PlayBGS)
{
	NextBGS = blanksound;
}

SaveGame();