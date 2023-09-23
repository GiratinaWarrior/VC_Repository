/// @description

if (hascontrol)
{

	//Draw Health Bar
	draw_sprite_stretched_ext(spr_PlayerHealthBorder, 1, HealthBarX, HealthBarY, HealthBarWidth, HealthBarHeight, c_red, 1);
	draw_sprite_stretched_ext(spr_PlayerHealthBar, 0, HealthBarX, HealthBarY, (global.Health/global.MaxHealth) * HealthBarWidth, HealthBarHeight, c_green, 1);
	draw_sprite_stretched_ext(spr_PlayerHealthBorder, 0, HealthBarX, HealthBarY, HealthBarWidth, HealthBarHeight, c_white, 1);
	var _moonmeter;
	var _mooncolor;

	//Decide the color of the icon based on if  its ready or not
	if (LunarCannonCooldown <= 0)
	{
		_mooncolor = c_white;
		_moonmeter = 1;
	}
	else
	{
		_mooncolor = c_black
		_moonmeter = map(LunarCannonCooldown, 0, 60, 0.75, -1);
	}


	//Draw the Lunar Cannon charge
	//draw_sprite_stretched_ext(spr_LunarCannon, 1, 220, 5, 32, 32, _mooncolor, _moonmeter);
	
	//Draw Vallen Meter
	draw_sprite_stretched(spr_PlayerVallenBorder, 1, VallenBarX, VallenBarY, VallenBarWidth, VallenBarHeight);
	draw_sprite_stretched_ext(spr_PlayerVallenBar, 0, VallenBarX, VallenBarY, (global.Vallen/global.MaxVallen) * VallenBarWidth, VallenBarHeight, c_white, 1);
	draw_sprite_stretched(spr_PlayerVallenBorder, 0, VallenBarX, VallenBarY, VallenBarWidth, VallenBarHeight);
	

}