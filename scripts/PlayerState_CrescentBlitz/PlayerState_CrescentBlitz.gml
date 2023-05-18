// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_CrescentBlitz(){

	xSpeed = lengthdir_x(CrescentBlitz_Speed, CrescentBlitz_Direction);
	ySpeed = lengthdir_y(CrescentBlitz_Speed, CrescentBlitz_Direction);
	
	Trail(c_black);
	
	Wall_StopRun();
	Wall_FallOn();
	
	x += xSpeed;
	y += ySpeed;
	
	CrescentBlitz_Duration -= CrescentBlitz_Speed;
	if (CrescentBlitz_Duration < 0 || !key_dash)
	{
		//xSpeed = 0;
		ySpeed = 0;
		PlayerState = PLAYERSTATE.NEUTRAL;
	}
	
}