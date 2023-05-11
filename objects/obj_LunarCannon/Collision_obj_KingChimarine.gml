/// @description Hits King Chimarine
with (obj_KCBossHealth)
{
	KC_Health -= other.Damage/2;
}

if (!PhaseThrough)
{
	instance_destroy();
}