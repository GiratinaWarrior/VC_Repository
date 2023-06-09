/// @description
var _hurtfunc = function()
{
	image_speed = 0;
}

var _recoverfunc = function()
{
	Attacked = false;
	image_speed = 1;
}

if (!Attacked)
{
	Enemy_Stunned(_hurtfunc, _recoverfunc);
}