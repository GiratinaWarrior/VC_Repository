

//---------Menu--------------//

GameOverMenu_Strive = function()
{
	LoadSave();
	TransitionStart(global.Spawnpoint, seq_FadeOut, seq_FadeIn);
	SummonPlayer(global.SpawnX, global.SpawnY);
	global.WarpTargetX = global.SpawnX;
	global.WarpTargetY = global.SpawnY;
	PlayerFullHeal();
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

//Menu(x, y, MenuOptions_2DArray, -1, ft_TitleScreen, blanksprite, c_white, c_yellow);
Menu(room_width/2, 750, MenuOptions_2DArray, -1 , ft_TitleScreen);

