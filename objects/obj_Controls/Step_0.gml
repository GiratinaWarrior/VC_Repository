/// @description Controls

//Move right and left
global.Key_Right = keyboard_check(vk_right) || keyboard_check(ord("D"));
global.Key_Left = keyboard_check(vk_left) || keyboard_check(ord("A"));

//Jumping
global.Key_Up = keyboard_check(vk_up) || keyboard_check(ord("W"));
global.Key_Jump =  global.Key_Up;

//Down key, used for attacking down in the air
global.Key_Down = keyboard_check(vk_down) || keyboard_check(ord("S"));

//Using Star Jump
global.Key_Starjump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));

//Using Cling To Hope
global.Key_Wall = keyboard_check_pressed(vk_space);

//Using the Selene Sword
global.Key_Sword = mouse_check_button_pressed(mb_left);

//Using the Lunar Cannon
global.Key_Cannon = keyboard_check(ord("Q"));

//Using the Crescent Blitz
global.Key_Dash = keyboard_check_pressed(vk_shift);

//Using Night Night
global.Key_Heal = keyboard_check(ord("F"));

//Interating with stuff
global.Key_Talk = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right);