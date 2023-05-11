/// @description Insert description here
// You can write your code in this editor
with (obj_KingChimarine)
{
	if (CurrentAttack != KC_PHASE.LIGHTNING)
	{
		instance_destroy(other);
	}
}