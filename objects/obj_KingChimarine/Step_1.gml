/// @description When King Chimarine perishes
with (obj_KCBossHealth)
{
	if (KC_Health <= 0)
	{
		instance_destroy();
		
		with (obj_KingChimarine)
		{
			TravelSpeed = 0;
			instance_change(obj_KingChimarineDeath, true);
		}
		
	}
	
}