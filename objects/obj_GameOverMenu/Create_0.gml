GameOverMenu_Strive = function()
{
	SlideTransition(TRANS_MODE.GOTO, global.Spawnpoint); 
	SummonPlayer();
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
