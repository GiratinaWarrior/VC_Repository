/// @description

if !(instance_exists(obj_Player))
{
	if (instance_exists(parent_EnemyAttack))
	{
		instance_destroy(parent_EnemyAttack);
	}
	Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.IDLE;
	Malvalia_FirstFight_Idle_StateChangeTimer = 0;
}

if (Health <= 0)
{
	
	//Switch to the Defeated State
	Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.DEFEATED;
	Malvalia_FirstFight_NextState = MALVALIA_FIRSTFIGHT_STATE.DEFEATED;
	
	sprite_index = spr_Malvalia_Falling;
	
	//Delete all attacks
	if (instance_exists(obj_BlackGeyser))
	{
		instance_destroy(obj_BlackGeyser);
	}
	if (instance_exists(obj_RedNeedles))
	{
		instance_destroy(obj_RedNeedles);
	}
	
	//Malvalia falls
	Gravity = 0.3;
	
	//Stop the player from moving, and make them face Malvalia
	obj_Player.hascontrol = false;
	if (obj_Player.x - x != 0) 
	{
		obj_Player.image_xscale = -sign(obj_Player.x - x);
	}
	
	SetRoomAudio_Music_Default(blanksound);

	
}



