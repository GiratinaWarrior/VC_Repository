/// @description Insert description here
// You can write your code in this editor

x = 990;
y = 448;
image_index = 0;
speed = 0;
image_speed = 0.25;

with (obj_PlayBGM)
{
	NextBGM = blanksound;
}

if (instance_exists(obj_FeralArrows))
{
	instance_destroy(obj_FeralArrows);
}

if (instance_exists(obj_RestInTurmoil))
{
	instance_destroy(obj_RestInTurmoil);
}

if (instance_exists(obj_PlayerHealth))
{
	instance_destroy(obj_PlayerHealth);
}

if (instance_exists(obj_VRBossHealth))
{
	instance_destroy(obj_VRBossHealth);
}

with (obj_NewPlayer)
{
	hascontrol = false;
	move = 0;
	x = 928;
	y = 512;
	image_xscale = 1;
}

audio_stop_sound(sound_FrenzyLaugh);


