GameOverMenu_Strive = function()
{
	SlideTransition(TRANS_MODE.GOTO, global.Spawnpoint); 
	SummonPlayer();
}

GameOverMenu_Surrender = function()
{
	game_end();
}

Test_1 = function()
{
	show_debug_message("Test 1");
}

Test_2 = function()
{
	show_debug_message("Test 2");
}

MenuOptions_2DArray =
[
	["Strive", Test_1],
	["Surrender", Test_2]
]



Menu(room_width/2, room_height/2, MenuOptions_2DArray, -1, ft_TitleScreen, blanksprite, c_white, c_yellow);
