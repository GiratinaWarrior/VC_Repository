/// @description
var _emptyfunc = function()
{
	audio_play_sound(sound_ShrineSoldierAttacked, 20, false);
}

var _recoverfunc = function()
{
	xSpeed = SoldierSpeed * image_xscale;
	SoldierState = SHRINESOLDIER_STATE.WALK;
	Attacked = false;
	image_speed = 1;
}

if (!Attacked)
{
	Enemy_Stunned(_emptyfunc, _recoverfunc);
}