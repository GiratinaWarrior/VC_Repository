/// @description Interact with the menu

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

if (global.Key_Talk && !global.MidTransition)
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

