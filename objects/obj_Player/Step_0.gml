/// @description Stuff

#region Collect player input

	//If the player has control over their own actions
	if (hascontrol == true) {

		//player inputs left, right, up, space
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
		key_jump = keyboard_check(vk_up) || keyboard_check(ord("W"))
		key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
		key_crouch = keyboard_check(vk_down) || keyboard_check(ord("S"));
		key_sword = mouse_check_button(mb_left);
		key_moon = keyboard_check(vk_space);
		key_dash = keyboard_check(vk_shift);
		key_heal = keyboard_check(vk_numpad1);
		
		move = key_right - key_left;

	}//end if player has control
	
	//if the player has control taken from them
	else if (hascontrol = false) {
			key_right = 0;
			key_left = 0;
			key_jump = 0;
			key_up = 0;
			key_crouch = 0;
			move = 0;
			key_sword = 0;
			key_moon = 0;
			key_dash = 0;
			key_heal = 0;
	}

#endregion