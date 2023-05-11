/// @description Insert description here
// You can write your code in this editor
with (obj_KingChimarine)
{
	if (CurrentAttack == KC_PHASE.CONJURE)
	{
		other.VR_ParabolicAccel = 3;
	}
	
	else 
	{
		other.VR_ParabolicAccel = 1;
	}
	
}

move_towards_point(obj_KCLinearMovement.x, obj_KCLinearMovement.y, KC_ParabolicSpeed * KC_ParabolicAccel);