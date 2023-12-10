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
global.Key_Sword = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("E"));

//Using the Lunar Cannon
global.Key_Cannon = keyboard_check_pressed(ord("Q"));

//Using the Crescent Blitz
global.Key_Dash = keyboard_check_pressed(vk_shift);

//Using Night Night
global.Key_Heal = keyboard_check(ord("F"));

//Interating with stuff
global.Key_Talk = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right);

//Skipping cutscenes
global.Key_Skip = keyboard_check(ord("C"));

//---------Controller--------//

/*

WASD arrows = joystick

Talk = B

Jump = A

Sword = Rtrigger

Cannon = Ltrigger

Heal = X

*/


if global.Key_Left || global.Key_Right || global.Key_Up || global.Key_Down || global.Key_Sword || global.Key_Cannon || global.Key_Talk || global.Key_Heal
{
	global.UsingController = 0;
}

var _GPsens = 0.5;

if abs(gamepad_axis_value(0, gp_axislh)) > _GPsens
{

	global.Key_Left = -sign(min(gamepad_axis_value(0, gp_axislh), 0));
	global.Key_Right = sign(max(gamepad_axis_value(0, gp_axislh), 0));
	global.UsingController = 1;
}

//If moving up and down
if abs(gamepad_axis_value(0, gp_axislv)) > (_GPsens - 0.2)
{
	global.Key_Up = -sign(min(gamepad_axis_value(0, gp_axislv), 0));
	global.Key_Down = sign(max(gamepad_axis_value(0, gp_axislv), 0));
	global.UsingController = 1;
}

//if A is pressed
if (gamepad_button_check(0, gp_face1))
{
	global.Key_Jump = 1;
	global.UsingController = 1;
}

//if Y is pressed
if (gamepad_button_check_pressed(0, gp_face4))
{
	global.Key_Talk = 1;
	global.UsingController = 1;
}

//if B is pressed
if (gamepad_button_check_pressed(0, gp_face2))
{
	global.Key_Heal = 1;
	global.UsingController = 1;
}

//if Right Trigger or X is pressed
if (gamepad_button_check_pressed(0, gp_shoulderrb)) || (gamepad_button_check_pressed(0, gp_face3))
{
	global.Key_Sword = 1;
	global.UsingController = 1;
}

//if Left Trigger is pressed
if (gamepad_button_check_pressed(0, gp_shoulderlb))
{
	global.Key_Cannon = 1;
	global.UsingController = 1;
}

