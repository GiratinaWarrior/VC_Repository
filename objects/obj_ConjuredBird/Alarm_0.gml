/// @description Insert description here
// You can write your code in this editor
IceTimer = IceCharge;
with(instance_create_layer(x + (image_xscale * 10), y, "KingChimarine", obj_IceFin))
{
	sprite_index = spr_ConjuredIceFin;
	Gravity = 0.1; 
	Damage = 4;
}
