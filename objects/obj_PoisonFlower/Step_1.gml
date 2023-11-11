/// @description Insert description here
// You can write your code in this editor

if (Health <= 0)
{
	if (PoisonFlower_State != POISONFLOWER_STATE.DIE && PoisonFlower_State != POISONFLOWER_STATE.WITHER) 
	{
		image_index = 0;
	}
	PoisonFlower_State = POISONFLOWER_STATE.DIE;
}




