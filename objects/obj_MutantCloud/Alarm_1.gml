/// @description Generate the Mutant Bolts
instance_create_layer(random_range(292, 1629), y + 10, "MutantBolt", obj_MutantBolt);
with (obj_KingChimarine)
{
	if (CurrentAttack == KC_PHASE.LIGHTNING)
	{
		other.alarm[1] = 5;
	}
}