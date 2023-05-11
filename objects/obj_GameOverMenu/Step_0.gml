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
		case 1:
			SlideTransition(TRANS_MODE.GOTO, global.Spawnpoint); 
			SummonPlayer();
			break;
		
		case 0: default:
			game_end(); 
			break;
	
	}

}
