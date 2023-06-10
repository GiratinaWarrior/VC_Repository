GameOverMenu_Strive = function()
{
	TransitionStart(global.Spawnpoint, seq_FadeOut, seq_FadeIn);
	global.Health = global.MaxHealth;
	SummonPlayer(global.SpawnX, global.SpawnY);
	global.WarpTargetX = global.SpawnX;
	global.WarpTargetY = global.SpawnY;
}

GameOverMenu_Surrender = function()
{
	game_end();
}

MenuOptions_2DArray =
[
	["Strive", GameOverMenu_Strive],
	["Surrender", GameOverMenu_Surrender]
]



Menu(room_width/2, room_height/2, MenuOptions_2DArray, -1, ft_TitleScreen, blanksprite, c_white, c_yellow);
