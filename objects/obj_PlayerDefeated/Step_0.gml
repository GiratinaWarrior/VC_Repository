/// @description Insert description here
// You can write your code in this editor

ySpeed += Gravity;
Wall_FallOn();
Wall_StopRun();
x += xSpeed;
y += ySpeed;

//show_debug_message("Player Defeat ySpeed: {0}", ySpeed)

if (round(ySpeed) == 0)
{
	image_speed = 1;
	sprite_index = spr_PlayerDefeated;
	AnimationStopAtEnd(spr_PlayerDefeated);
}




