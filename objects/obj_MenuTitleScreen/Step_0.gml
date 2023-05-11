/// @description Control Menu

//item ease in
menu_y += (menu_y_target - menu_y) / menu_speed;

//keyboard controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_space))
	{
		menu_y_target = -1000;
		menu_committed = menu_cursor;
		menu_control = false;
	}

	
}//end keyboard controls

if (menu_y < -100) && (menu_committed != -1) {

	switch (menu_committed) 
	{
		//New Game
		case 1:
			global.SpawnX = 904;
			global.SpawnY = 228; 
			global.Spawnpoint = Room_NoxCity;
			SlideTransition(TRANS_MODE.GOTO, FirstPlayerRoom); 
			SummonPlayer();
			break;
		
		//Continue
		case 2:
			{
				//If a savefile does not exist
				if (!file_exists(SAVEFILE)) {
					global.SpawnX = 904;
					global.SpawnY = 228; 
					global.Spawnpoint = Room_NoxCity;
					SlideTransition(TRANS_MODE.GOTO, FirstPlayerRoom); 
					SummonPlayer();
				}//end savefile doesn't exist
				
				//If a savefile exists, transfer the data within it
				else {
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
			break;
		
		case 0: 
			game_end(); 
			break;
	
	}

}
