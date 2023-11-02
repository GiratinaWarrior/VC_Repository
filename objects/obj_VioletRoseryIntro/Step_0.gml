/// @description Insert description here
// You can write your code in this editor
image_alpha += 0.01;

with (obj_Camera)
{
	follow = other.id;
}

if (image_alpha > 0)
{
	with (obj_PlayBGM)
	{
		NextBGM = music_VlastelTheme;
	}
}

if (image_alpha >= 2)
{
	obj_Player.hascontrol = true;
	
	with (obj_Camera)
	{
		follow = noone;
	}
	
	with (obj_VRBossAura)
	{
		part_system_destroy(DarkAura);
	}
	
	instance_change(obj_VioletRosery, true);
	
	instance_create_layer(x, y, "VioletRosery", obj_VRBossHealth);
	
	instance_create_layer(x, y, "Player", obj_PlayerHealth);
	
}