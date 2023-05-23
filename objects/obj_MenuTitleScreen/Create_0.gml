/// @description GUI/Vars/Menu setup
#macro SAVEFILE "Save.sav"

FirstPlayerRoom = Room_RoseRoom;

TitleMenu_NewGame = function()
{
	SetSpawnpoint(128, 128, Room_RoseRoom);
	//SlideTransition(TRANS_MODE.GOTO, FirstPlayerRoom); 
	TransitionStart(FirstPlayerRoom, seq_FadeOut, seq_FadeIn);
	SummonPlayer();
}

TitleMenu_Continue = function()
{
	//If a savefile does not exist
	if (!file_exists(SAVEFILE)) 
	{
		TitleMenu_NewGame();
		//show_debug_message("Save doesnt exist : Make new one");
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
		//SlideTransition(TRANS_MODE.GOTO, target);
		TransitionStart(target, seq_FadeOut, seq_FadeIn);
		show_debug_message("Target Room Read From File: {0}" , room_get_name(target));
		show_debug_message("Global Spawnpoint: {0}", room_get_name(global.Spawnpoint));
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

Menu(room_width/2 + 200, room_height/2, MenuOptions_2DArray, -1 ,ft_TitleScreen);
