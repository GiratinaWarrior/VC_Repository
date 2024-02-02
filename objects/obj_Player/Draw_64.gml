/// @description

if (hascontrol)
{


	//Draw the hearts
	draw_sprite_ext(spr_PlayerHeart, 0, HealthBarX, HealthBarY, global.MaxHealth, 1, 0, c_black, 1);
	draw_sprite_ext(spr_PlayerHeart, 0, HealthBarX, HealthBarY, global.Health, 1, 0, c_white, 1);

	//Draw the true vallen meter
	draw_sprite_ext(spr_PlayerVallenSymbol, 0, VallenBarX, VallenBarY, global.MaxVallen, 1, 0, c_black, 1);
	draw_sprite_ext(spr_PlayerVallenSymbol, 0, VallenBarX, VallenBarY, global.Vallen, 1, 0, c_white, 1);
	

}