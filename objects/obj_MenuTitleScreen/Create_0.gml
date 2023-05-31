/// @description GUI/Vars/Menu setup

FirstPlayerRoom = Room_OpeningCutscene;

TitleMenu_NewGame = function()
{
	DeleteSave()
	TransitionStart(FirstPlayerRoom, seq_FadeOut, seq_FadeIn);
	//show_debug_message("TitleScreen New Game Spawnpoint: {0}", room_get_name(global.Spawnpoint));
	//SummonPlayer();
}

TitleMenu_Continue = function()
{

		#region New Load Save Mechanic
		
		LoadSave();
	
		TransitionStart(global.Spawnpoint, seq_FadeOut, seq_FadeIn);
		SummonPlayer(global.SpawnX, global.SpawnY);
		global.WarpTargetX = global.SpawnX;
		global.WarpTargetY = global.SpawnY;
		#endregion
		
	
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
