/// @description Interact with the menu


/*
Menu_MouseOver = false;

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + Menu_Width, y + Menu_Height))
{
	Menu_MouseOver = true;
	
	if (Menu_MouseXPrev != mouse_x) || (Menu_MouseYPrev != mouse_y)
	{
		var _mouseHoverLine = (mouse_y - y) div Menu_HeightLine;
		
		if !(Menu_Desc == -1) 
		{
			_mouseHoverLine -= 1;
		}
		
		if (_mouseHoverLine < 0) 
		{
			_mouseHoverLine = 0;
		}
		
		else if (_mouseHoverLine > Menu_NumOfOptions - 1) 
		{
			_mouseHoverLine = Menu_NumOfOptions - 1;
		}
		
		Menu_Hover = _mouseHoverLine;
	}
	
}

*/

if !(Menu_Chosen)
{
	Menu_Hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
}

if (Menu_Hover > Menu_NumOfOptions - 1)
{
	Menu_Hover = Menu_NumOfOptions - 1;
}
if (Menu_Hover < 0)
{
	Menu_Hover = 0;
}

if (keyboard_check_pressed(vk_enter))
{
	Menu_Chosen = true;
	if (array_length(Menu_Options[Menu_Hover]) == 2)
	{
		var _func = Menu_Options[Menu_Hover][1];
		if (_func != -1) _func();
	}
	instance_destroy(id);
}

//Menu_MouseXPrev = mouse_x;
//Menu_MouseYPrev = mouse_y;

