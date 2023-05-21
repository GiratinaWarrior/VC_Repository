/// @description GUI/Vars/Menu setup
#macro SAVEFILE "Save.sav"

menu_x = room_width/2;// - gui_margin;
menu_y = room_height + 200;
menu_y_target = room_height/2 + 200;
menu_speed = 25; //lower is faster
menu_itemheight = font_get_size(font_TitleScreen);
menu_committed = -1;
menu_control = true;

menu[2] = "Continue";
menu[1] = "New Game"
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;

FirstPlayerRoom = Room_Testing;

TitleMenu_NewGame = function()
{
	global.SpawnX = 990;
	global.SpawnY = 540; 
	global.Spawnpoint = Room_NoxCity;
	SlideTransition(TRANS_MODE.GOTO, FirstPlayerRoom); 
	SummonPlayer();
}

TitleMenu_Continue = function()
{
	//If a savefile does not exist
	if (!file_exists(SAVEFILE)) 
	{
		TitleMenu_NewGame()
	}//end savefile doesn't exist
				
	//If a savefile exists, transfer the data within it
	else 
	{
		var file = file_text_open_read(SAVEFILE);
		var target = file_text_read_real(file);
		var startx = file_text_read_real(file);
		var starty = file_text_read_real(file);
		var saveArray = global.SavedVar;
		for (var f = 3; f < array_length(saveArray); f++)
		{
			saveArray[f] = file_text_read_real(file);
		}
		file_text_close(file);
		global.SavedVar = saveArray;
		SlideTransition(TRANS_MODE.GOTO, target);
		SummonPlayer(startx, starty);
	}
} 

TitleMenu_Quit = function()
{
	game_end(); 
}

MenuOptions_2DArray = 
[
	["Continue", TitleMenu_Continue],
	["New Game", TitleMenu_NewGame],
	["Quit", TitleMenu_Quit]
]

Menu(room_width/2 + 200, room_height/2, MenuOptions_2DArray, -1 ,font_TitleScreen);
