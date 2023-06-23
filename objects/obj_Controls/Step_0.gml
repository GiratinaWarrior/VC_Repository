/// @description
global.Key_Right = keyboard_check(vk_right) || keyboard_check(ord("D"));
global.Key_Left = keyboard_check(vk_left) || keyboard_check(ord("A"));
global.Key_Up = keyboard_check(vk_up) || keyboard_check(ord("W"));
global.Key_Down = keyboard_check(vk_down) || keyboard_check(ord("S"));
global.Key_Jump =  global.Key_Up;
global.Key_Starjump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
global.Key_Wall = keyboard_check_pressed(vk_space);
global.Key_Sword = mouse_check_button_pressed(mb_left);
global.Key_Cannon = keyboard_check(ord("Q"));
global.Key_Dash = keyboard_check_pressed(vk_shift);
global.Key_Heal = keyboard_check(ord("F"));
global.Key_Talk = mouse_check_button_pressed(mb_right);