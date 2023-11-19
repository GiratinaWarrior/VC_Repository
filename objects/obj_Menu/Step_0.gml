/// @description Interact with the menu

Menu_Move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

Menu_StartAlpha = min(1, Menu_StartAlpha + 0.01);

if !(Menu_Chosen)
{
	
	if abs(gamepad_axis_value(0, gp_axislv)) > 0.9 && Menu_Move == 0 && Menu_TimeSource == noone
	{
		Menu_Move = sign(gamepad_axis_value(0, gp_axislv));
		Menu_TimeSource = TimeSourceCreateAndStart(10, function(){Menu_Move = 0; time_source_destroy(Menu_TimeSource); Menu_TimeSource = noone;});
		//Menu_Move = 0;
	}
		
	Menu_Hover += Menu_Move;
	
	//show_debug_message("MenuMove: {0}", Menu_Move);
}

Menu_Hover = clamp(Menu_Hover, 0, Menu_NumOfOptions - 1); 

if (global.Key_Talk && !global.MidTransition) && (Menu_StartAlpha == 1)
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

