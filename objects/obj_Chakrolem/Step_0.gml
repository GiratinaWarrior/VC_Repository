/// @description Insert description here
// You can write your code in this editor

#region Movement

	ySpeed += Gravity;

	Wall_FallOn();
	Wall_StopRun()
	Wall_LedgeTurn();
	
	Boundary_SwitchRun();
	
	x += xSpeed;
	y += ySpeed;

#endregion 

#region State Changing

	if (instance_exists(obj_Player))
	{
		
		if ((abs(x - obj_Player.x) < 250 && abs(y - obj_Player.y) < 32))
		{
			PlayerInRange = true;
		}
		else
		{
			PlayerInRange = false;
		}
		
	}
	else
	{
		PlayerInRange = false;
	}

	if (Attacked) && (Chakrolem_State != CHAKROLEM_STATE.EXPLODE)
	{
		Chakrolem_State = CHAKROLEM_STATE.HURT;
	}

#endregion

#region State Machine

switch (Chakrolem_State)
{
	case CHAKROLEM_STATE.IDLE:
		
		sprite_index = spr_Chakrolem_Idle;
		
		xSpeed = 0;
		
		image_speed = 1;
		
		if (PlayerInRange)
		{
			Chakrolem_State = CHAKROLEM_STATE.NOTICE;
		}
		
		break;
		
	case CHAKROLEM_STATE.HURT:
		
		sprite_index = spr_Chakrolem_Idle;
		
		image_speed = 0;
		
		break;
	
	case CHAKROLEM_STATE.NOTICE:
	
		if (Chakrolem_SurpriseSeq = noone)
		{
			audio_play_sound(sound_EnemyAlert, 100, false);
			Chakrolem_SurpriseSeq = layer_sequence_create(layer, x, y - 50, seq_ExclamationMark_Fast);
		}
		else if (layer_sequence_is_finished(Chakrolem_SurpriseSeq))
		{
			Chakrolem_State = CHAKROLEM_STATE.CHASE;
			layer_sequence_destroy(Chakrolem_SurpriseSeq);
		}
	
		break;
	
	case CHAKROLEM_STATE.CHASE:
		
		ChakrolemState_Chase();	
		
		break;
		
	case CHAKROLEM_STATE.CHARGE:
		
		ChakrolemState_Charge();
		
		break;	
	
	case CHAKROLEM_STATE.EXPLODE:
		
		ChakrolemState_Explode();
		
		break;
	
}

#endregion








