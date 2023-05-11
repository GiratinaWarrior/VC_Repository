/// @description Hit Violet Rosery

//Decrease health
with (obj_VRBossHealth)
{
	VR_Health -= other.Damage/4;
}

//Access Violet Rosery's code
with (other)
{
	//Make it FLASH
	Attacked = true;
	if (!alarm[11])
	{

		alarm[11] = FlashLength;

	}
}//end VR code


if (!PhaseThrough)
{
	instance_destroy();
}