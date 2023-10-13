/// @description Insert description here
// You can write your code in this editor

var _hurtfunc = function()
{
	
}

var _recoverfunc = function()
{
	Chakrolem_State = CHAKROLEM_STATE.IDLE;
	xSpeed = 0;
	Attacked = false;
	Chakrolem_SurpriseSeq = noone;
	image_speed = 1;
}

if !(Attacked) && (Chakrolem_State != CHAKROLEM_STATE.EXPLODE)
{
	Enemy_Stunned(_hurtfunc, _recoverfunc);
}





