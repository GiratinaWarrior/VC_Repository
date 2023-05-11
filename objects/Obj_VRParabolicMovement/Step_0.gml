/// @description Insert description here
// You can write your code in this editor

with (obj_VioletRosery)
{
	if (CurrentAttack == VR_PHASE.FRENZY)
	{
		other.VR_ParabolicAccel = 3;
	}
	
	else 
	{
		other.VR_ParabolicAccel = 1;
	}
	
}

move_towards_point(obj_VRLinearMovement.x, obj_VRLinearMovement.y, VR_ParabolicSpeed * VR_ParabolicAccel);