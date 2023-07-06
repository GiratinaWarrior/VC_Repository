/// @description The body bobs back and forth
var _hurtfunc = function()
{
	ShrineDummy_HitFrom = point_direction(obj_Player.x, obj_Player.y, x, y);
	ShrineDummy_Rebound = ShrineDummy_MaxRebound;
}

var _recoverfunc = function()
{
	Attacked = false;
}


Enemy_Stunned(_hurtfunc, _recoverfunc);