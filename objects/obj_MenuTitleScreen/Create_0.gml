/// @description GUI/Vars/Menu setup

FirstPlayerRoom = Room_OpeningCutscene;

TestPlayerRoom = Room_Testing;

TitleMenu_NewGame = function()
{
	DeleteSave()
	audio_play_sound(sound_TitleScreenSelect, 400, false);
	TransitionStart(FirstPlayerRoom, seq_FadeOut, seq_FadeIn);
}

TitleMenu_Continue = function()
{

	#region New Load Save Mechanic
		
		audio_play_sound(sound_TitleScreenSelect, 400, false);
		
		LoadSave();
	
		if (SaveExists())
		{
			TransitionStart(global.Spawnpoint, seq_FadeOut, seq_FadeIn);
			SummonPlayer(global.SpawnX, global.SpawnY);
			global.WarpTargetX = global.SpawnX;
			global.WarpTargetY = global.SpawnY;
		}
		else
		{
			TransitionStart(FirstPlayerRoom, seq_FadeOut, seq_FadeIn);
		}
		
		
	#endregion
		
	
} 

TitleMenu_Quit = function()
{
	TransitionStart(Room_GameEnd, seq_FadeOut, seq_FadeIn);
}

TitleMenu_Testing = function()
{
	TransitionStart(TestPlayerRoom, seq_FadeOut, seq_FadeIn);
	SummonPlayer(960, 790);
}

MenuOptions_2DArray = 
[
	["Continue", TitleMenu_Continue],
	["New Game", TitleMenu_NewGame],
	["Quit", TitleMenu_Quit],
//	["TESTING", TitleMenu_Testing]
]

Menu(x, y, MenuOptions_2DArray, -1, ft_TitleScreen);
