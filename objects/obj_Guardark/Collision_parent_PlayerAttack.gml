/// @description

var _hurtfunc = function()
{
	
}

var _recoverfunc = function()
{
	xSpeed = Guardark_Speed * Guardark_Dir;
	Guardark_State = GUARDARK_STATE.PATROL;
	Attacked = false;
	image_speed = 1;
}

if !(Attacked)
{
	Enemy_Stunned(_hurtfunc, _recoverfunc);
}
