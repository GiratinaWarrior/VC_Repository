/// @description

var _hurtfunc = function()
{

}

var _recoverfunc = function()
{
	Attacked = false;
}

if !(Attacked) && (Malvalia_FirstFight_CurrentState != MALVALIA_FIRSTFIGHT_STATE.TELEPORT)
{
	Enemy_Stunned(_hurtfunc, _recoverfunc);
}