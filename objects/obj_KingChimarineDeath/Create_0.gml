/// @description Insert description here
// You can write your code in this editor

x = 960;
y = 448;

image_index = 0;
speed = 0;
image_speed = 0.25;
ySpeed = 0.0001;

with (obj_PlayBGM)
{
	NextBGM = blanksound;
}

if (instance_exists(obj_MutantCloud))
{
	instance_destroy(obj_MutantCloud);
}

if (instance_exists(obj_MutantBolt))
{
	instance_destroy(obj_MutantBolt);
}

if (instance_exists(obj_BossAcid))
{
	instance_change(obj_BossWater, true);
}

if (instance_exists(obj_PlayerHealth))
{
	instance_destroy(obj_PlayerHealth);
}

if (instance_exists(obj_ConjuredCrab))
{
	instance_destroy(obj_ConjuredCrab);
}

if (instance_exists(obj_ConjuredCrabDead))
{
	instance_destroy(obj_ConjuredCrabDead);
}

if (instance_exists(obj_ConjuredBird))
{
	instance_destroy(obj_ConjuredBird);
}

if (instance_exists(obj_ConjuredBirdDead))
{
	instance_destroy(obj_ConjuredBirdDead);
}

if (instance_exists(obj_CrabBlast))
{
	instance_destroy(obj_CrabBlast);
}

if (instance_exists(obj_IceFin))
{
	instance_destroy(obj_IceFin);
}

if (instance_exists(obj_KCBossHealth))
{
	instance_destroy(obj_KCBossHealth);
}

with (obj_Player)
{
	hascontrol = false;
	move = 0;
	x = 864;
	y = 480;
	image_xscale = 1;
}

audio_stop_all();