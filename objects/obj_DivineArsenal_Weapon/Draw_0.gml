/// @description Insert description here
// You can write your code in this editor

if (DivineArsenalWeapon_DistFromPortal < sprite_width)
{
	draw_sprite_part(sprite_index, image_index, 0, 0, min(sprite_width, DivineArsenalWeapon_DistFromPortal), sprite_height, x - sprite_xoffset, y - sprite_yoffset)
}
else
{
	draw_self();
}



