///BossHealthBar()
///This function displays the bosses health bat
///@param MaxHealth
///@param Health
///@param Name
///@param BarColor
///@param MainTextColor
///@param OutlineTextColor
///@param OutlineOffset
function BossHealthBar(_maxhealth, _health, _bossname, _barcolor = c_white, _maintextcolor = c_white, _textoutlinecolor = c_black, _outlineoffset = 1){
	
	var _barwidth = 500
	var _x = WINDOW_WIDTH/2 - _barwidth/2;
	var _y = 20;
	var _barheight = _barwidth/10;
	
	draw_sprite_stretched_ext(spr_BossHealthBar, 0, _x, _y, (_health/_maxhealth) * _barwidth, _barheight, _barcolor, 1);
	draw_sprite_stretched(spr_BossHealthBorder, 0, _x, _y, _barwidth, _barheight);

	DrawSetText(_textoutlinecolor, ft_BossName, fa_center, fa_center);
	draw_text(_x + _barwidth/2, _y + _barheight/2, _bossname);

	//offset black
	draw_text(_x + _barwidth/2 + _outlineoffset, _y + _barheight/2 + _outlineoffset, _bossname);
	draw_text(_x + _barwidth/2 + _outlineoffset, _y + _barheight/2 - _outlineoffset, _bossname);
	draw_text(_x + _barwidth/2 - _outlineoffset, _y + _barheight/2 + _outlineoffset, _bossname);
	draw_text(_x + _barwidth/2 - _outlineoffset, _y + _barheight/2 - _outlineoffset, _bossname);

	draw_set_color(_maintextcolor);
	draw_text(_x + _barwidth/2, _y + _barheight/2, _bossname);

}