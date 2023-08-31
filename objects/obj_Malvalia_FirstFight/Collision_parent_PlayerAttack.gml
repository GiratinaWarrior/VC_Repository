/// @description

var _hurtfunc = function()
{

}

var _recoverfunc = function()
{
	Attacked = false;
}

if !(Attacked)
{
	Enemy_Stunned(_hurtfunc, _recoverfunc);
}