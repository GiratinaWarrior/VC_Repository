/// @description Change Location

with (obj_VioletRosery)
{
	if (CurrentAttack == VR_PHASE.FRENZY)
	{
		VRTargetChangeSpeed = 2;
	}
	
	else 
	{
		VRTargetChangeSpeed = 1;
	}
	
}


x = random_range(512, 1376);
y = random_range(288, 576);
alarm[0] = VRTargetChange/VRTargetChangeSpeed;