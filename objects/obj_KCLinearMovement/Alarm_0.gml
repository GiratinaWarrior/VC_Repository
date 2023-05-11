/// @description Insert description here
// You can write your code in this editor
with (obj_KingChimarine)
{
	if (CurrentAttack == KC_PHASE.CONJURE)
	{
		KCTargetChangeSpeed = 2;
	}
	
	else 
	{
		KCTargetChangeSpeed = 1;
	}
	
}


x = random_range(64, 1920);
y = random_range(96, 672);
alarm[0] = KCTargetChange/KCTargetChangeSpeed;