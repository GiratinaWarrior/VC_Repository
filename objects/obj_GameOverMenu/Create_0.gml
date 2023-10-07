GameOverMenu_Strive = function()
{
	audio_play_sound(sound_TitleScreenSelect, 400, false);
	TransitionStart(global.Spawnpoint, seq_FadeOut, seq_FadeIn);
	global.Health = global.MaxHealth;
	SummonPlayer(global.SpawnX, global.SpawnY);
	global.WarpTargetX = global.SpawnX;
	global.WarpTargetY = global.SpawnY;
}

GameOverMenu_Surrender = function()
{
	TransitionStart(Room_GameEnd, seq_FadeOut, seq_FadeIn);
}

MenuOptions_2DArray =
[
	["Strive", GameOverMenu_Strive],
	["Surrender", GameOverMenu_Surrender]
]



Menu(room_width/2, room_height/2, MenuOptions_2DArray, -1, ft_TitleScreen, blanksprite, c_white, c_yellow);
