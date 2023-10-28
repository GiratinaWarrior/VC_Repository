///Blood Petals
function LavenderBossBattle_Prologue_BloodPetals()
{
	
	show_debug_message("Particles: {0} ", LavenderBossBattlePrologue_BloodPetals_Particle);
	show_debug_message("Max Petal Timer: {0}", LavenderBossBattlePrologue_MaxPetalTimer);
	show_debug_message("Petal Rate Timer: {0}", LavenderBossBattlePrologue_PetalTimer);
	
	var petalX = obj_Camera.x + (random_range(-1, 1) * 700);
	var petalY = -random_range(50, 150);
				
	with(instance_create_layer(petalX, petalY, "BloodPetal", obj_BloodPetal))
	{
		xSpeed  = random_range(4, 7);
		ySpeed  = xSpeed;
	}
	
	
}//end function
	
function LavenderBossBattle_Prologue_PoisonSeed()
{
	
}