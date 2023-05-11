/// @description When Violet Rosery perishes
with (obj_VRBossHealth)
{
	if (VR_Health <= 0)
	{
		instance_destroy();
		
		with (obj_VioletRosery)
		{
			instance_change(obj_VioletRoseryDeath, true);
		}
		
	}
	
}