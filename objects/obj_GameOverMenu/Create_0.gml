/// @description GUI/Vars/Menu setup

menu_x = room_width/2;// - gui_margin;
menu_y = room_height + 200;
menu_y_target = room_height/2 + 300;
menu_speed = 25; //lower is faster
menu_itemheight = font_get_size(font_TitleScreen);
menu_committed = -1;
menu_control = true;

menu[1] = "Strive";
menu[0] = "Surrender";

menu_items = array_length_1d(menu);
menu_cursor = 2;

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

Menu(room_width/2 + 200, room_height/2, MenuOptions_2DArray, -1, font_TitleScreen);