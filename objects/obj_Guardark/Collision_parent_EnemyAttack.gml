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

if !(Attacked) && (other.Reflected || other.FriendlyFire)
{
	other.PlayerAttackDamage = other.Damage;
	Enemy_Stunned(_hurtfunc, _recoverfunc);
}






