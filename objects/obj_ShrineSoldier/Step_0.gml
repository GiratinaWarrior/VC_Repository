/// @description Real Stuff

#region Movement

	ySpeed += Gravity;

	Wall_FallOn();
	Wall_SwitchRun();
	Wall_LedgeTurn();

	x += xSpeed;
	y += ySpeed;

#endregion Movement

#region State Transition

if (!Attacked)
{
	
}

else
{
	
}

#endregion