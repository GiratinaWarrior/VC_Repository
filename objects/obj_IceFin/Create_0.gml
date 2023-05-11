/// @description Summon
ySpeed = 0;
Gravity = 0.3;
image_index = 0;
image_speed = 0;

image_alpha = 7;
meltrate = 0;//0.01;

if (instance_exists(obj_NewPlayer))
{

	if (abs(obj_NewPlayer.x - x) < 495) audio_play_sound(sound_IceFin, 15, false);
	
}