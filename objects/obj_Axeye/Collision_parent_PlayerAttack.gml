/// @description
var _emptyfunc = function()
{
	xSpeed = lengthdir_x(Axeye_Speed_IdleMain, HitFrom);
	
	x += xSpeed;
			
	ySpeed = lengthdir_y(Axeye_Speed_IdleMain, HitFrom);
	
	y += ySpeed;
}

var _recoverfunc = function()
{
	Axeye_State = AXEYE_STATE.IDLE;
	Attacked = false;
	Damage = 1;
	image_speed = 1;
}

if (!Attacked)
{
	Enemy_Stunned(_emptyfunc, _recoverfunc);
}





