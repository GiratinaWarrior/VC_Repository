/// @description

if (hascontrol)
{

	draw_sprite_stretched(spr_PlayerHealthBar, 0, HealthBarX, HealthBarY, (global.Health/global.MaxHealth) * HealthBarWidth, HealthBarHeight);
	draw_sprite_stretched(spr_PlayerHealthBorder, 0, HealthBarX, HealthBarY, HealthBarWidth, HealthBarHeight);

	var _moonmeter;
	var _mooncolor;

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

	draw_sprite_stretched_ext(spr_LunarCannon, 1, 220, 5, 32, 32, _mooncolor, _moonmeter);
	
	DrawSetText(c_red, ft_Sign, fa_left, fa_top);
	draw_text(10, 40, $"x: {x}");
	draw_text(10, 60, $"y: {y}");
	

}