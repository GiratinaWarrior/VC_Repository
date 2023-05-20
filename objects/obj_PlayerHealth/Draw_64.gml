/// @description Draw the Health and Moon Meter

draw_sprite_stretched(spr_PlayerHealthBar, 0, HealthBarX, HealthBarY, (global.Health/MaxHealth) * HealthBarWidth, HealthBarHeight);
draw_sprite_stretched(spr_PlayerHealthBorder, 0, HealthBarX, HealthBarY, HealthBarWidth, HealthBarHeight);

with (obj_Player)
{
	var _moonmeter;
	var _mooncolor;

	if (firingdelay <= 0)
	{
		_mooncolor = c_white;
		_moonmeter = 1;
	}
	else
	{
		_mooncolor = c_black
		_moonmeter = map(firingdelay, 0, 60, 0.75, -1);
	}

	draw_sprite_stretched_ext(spr_LunarCannon, 1, 220, 5, 32, 32, _mooncolor, _moonmeter);
}