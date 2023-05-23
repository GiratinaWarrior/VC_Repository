/// @description

var _hurtfunc = function()
{
	
}
var _recoverfunc = function()
{
	MantisState = MASKMANTIS_STATE.WALK;
	xSpeed = MantisSpeed * image_xscale;
	Attacked = false;
	image_speed = 1;
}

if (!Attacked)
{
	Enemy_Stunned(_hurtfunc, _recoverfunc);
}