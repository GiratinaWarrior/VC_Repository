/// @description Insert description here
// You can write your code in this editor
DarkAura = part_system_create_layer("Aura", false, ps_BossAppear);
part_system_position(DarkAura, x, y);

with (instance_create_layer(x, y, "KingChimarine", obj_KingChimarineIntro))
{
	image_alpha = -1;
}