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
		
		if abs(x - obj_Player.x) < 550 && abs(y - obj_Player.y) < 64
		{
			PlayerInRange = true;
		}
		else if abs(x - obj_Player.x) > 650 || abs(y - obj_Player.y) >= 64
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

//State Machine for Chakrolem
switch (Chakrolem_State)
{
	//Idle State: Chakrolem waits in place
	case CHAKROLEM_STATE.IDLE:
		
		#region Idle
		
			sprite_index = spr_Chakrolem_Idle;
		
			xSpeed = 0;
		
			image_speed = 1;
		
			if (PlayerInRange)
			{
				Chakrolem_State = CHAKROLEM_STATE.NOTICE;
			}
			
		#endregion
		
		break;//end Idle
		
	//Hurt State: Chakrolem gets hurt
	case CHAKROLEM_STATE.HURT:
		
		#region Hurt
		
			sprite_index = spr_Chakrolem_Idle;
		
			image_speed = 0;
			
		#endregion
		
		break;//end Hurt State
	
	case CHAKROLEM_STATE.NOTICE:
	
		if (Chakrolem_SurpriseSeq = noone)
		{
			audio_play_sound(sound_EnemyAlert, 100, false);
			Chakrolem_SurpriseSeq = layer_sequence_create(layer, x, y - 50, seq_ExclamationMark_Fast);
			layer_sequence_speedscale(Chakrolem_SurpriseSeq, 1.5);
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








