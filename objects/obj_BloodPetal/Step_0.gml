/// @description Insert description here
// You can write your code in this editor

image_angle -= BloodPetal_RotationSpeed;

x += xSpeed; 
y += ySpeed;

if (!BloodPetal_Appear && Instance_InView())
{
	audio_play_sound(sound_BloodPetal, 150, false, 0.5);
	BloodPetal_Appear = true;
}

if (y < -30) && (ySpeed < 0)
{
	instance_destroy();
}

Wall_BounceOn();



