/// @description Insert description here
// You can write your code in this editor
var _hurtfunc = function()
{
	var _knockSpeed = (sign(x - obj_Player.x) * ShrineDummy_KnockbackForce)
		
	if (place_meeting(x + _knockSpeed + (sign(_knockSpeed) * 16), y + 1, obj_Wall))
	{
		x += _knockSpeed;
	}
	
}

var _recoverfunc = function()
{
	Attacked = false;
}

if !(Attacked)
{
	Enemy_Stunned(_hurtfunc, _recoverfunc);
}
