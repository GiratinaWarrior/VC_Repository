/// @description Insert description here
// You can write your code in this editor
image_alpha += 0.01;

if (image_alpha > 0)
{
	with (obj_PlayBGM)
	{
		NextBGM = music_NightfallKnightTheme;
	}
}

if (image_alpha >= 2)
{
	obj_Player.hascontrol = true;
	
	obj_Camera.follow = obj_Player;
	
	with (obj_KCBossAura)
	{
		part_system_destroy(DarkAura);
	}
	
	instance_change(obj_KingChimarine, true);
	
	instance_create_layer(x, y, "KingChimarine", obj_KCBossHealth);
	
	instance_create_layer(x, y, "Player", obj_PlayerHealth);
	
}