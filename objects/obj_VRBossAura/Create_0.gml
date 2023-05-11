/// @description Summons Violet Rosery

DarkAura = part_system_create_layer("Aura", false, ps_BossAppear);
part_system_position(DarkAura, x, y);

with (instance_create_layer(x, y, "VioletRosery", obj_VioletRoseryIntro))
{
	image_alpha = -1;
}

with (obj_Camera)
{
	follow = noone;
}