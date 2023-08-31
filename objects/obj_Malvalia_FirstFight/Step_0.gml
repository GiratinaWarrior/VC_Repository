/// @description

//Malvalia faces the player
if (instance_exists(obj_Player))
{
	
	//image_xscale = sign(x - obj_Player.x);
	
}//end face player

//Malvalia State machine
switch(Malvalia_FirstFight_CurrentState)
{
	//Idle State: Malvalia floats in place
	case MALVALIA_FIRSTFIGHT_STATE.IDLE:
		
		#region Idle
			
			sprite_index = spr_Malvalia_Fly;
			
			//After the teleport timer is finished, change to the teleport state
			if  (Malvalia_FirstFight_Teleport_Timer++ > Malvalia_FirstFight_Teleport_TimerLimit)
			{
				Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.TELEPORT;
				Malvalia_FirstFight_Teleport_Timer = 0;
			}
			
			//If the attack state timer is finished, change to an attacking state
			else if (Malvalia_FirstFight_Idle_StateChangeTimer++ > Malvalia_FirstFight_Idle_StateChangeTimerLimit)
			{
				Malvalia_FirstFight_Idle_StateChangeTimer = 0; 
				Malvalia_FirstFight_CurrentState = Malvalia_FirstFight_NextState;
			}
			
			
		#endregion
		
		break;//end Idle State
		
	//Teleport State: Malvalia teleports elsewhere
	case MALVALIA_FIRSTFIGHT_STATE.TELEPORT:
		
		#region Teleport
		
			if !(layer_sequence_exists(layer, Malvalia_FirstFight_Teleport_Sequence))
			{
				//Create the sequence
				Malvalia_FirstFight_Teleport_Sequence = layer_sequence_create(layer, x, y, seq_MalvaliaBossBattle_Teleport);
				//Get the instance id
				Malvalia_FirstFight_Teleport_SequenceInstance = layer_sequence_get_instance(Malvalia_FirstFight_Teleport_Sequence);
				//Override the sequence
				sequence_instance_override_object(Malvalia_FirstFight_Teleport_SequenceInstance, obj_Malvalia_FirstFight, id);
			}
			//If the sequence is finished
			else if (layer_sequence_is_finished(Malvalia_FirstFight_Teleport_Sequence))
			{
				layer_sequence_destroy(Malvalia_FirstFight_Teleport_Sequence);
				Malvalia_FirstFight_Teleport_Sequence = noone;
				Malvalia_FirstFight_Teleport_SequenceInstance = noone;
				Malvalia_FirstFight_Teleport_SequenceCreated = false;
				Malvalia_FirstFight_Teleport_Timer = 0;
				Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.IDLE;
			}
		
		#endregion
	
		break;//end Teleport State
	
	//Black Geyser State: Malvalia summons a vallen spell in the form of black energy bursting from the ground
	case MALVALIA_FIRSTFIGHT_STATE.BLACK_GEYSER:
		
		#region Black Geyser
			
			//If the current sprite is flying, change to the charge sprite
			if (sprite_index == spr_Malvalia_Fly)
			{
				image_index = 0;
				sprite_index = spr_Malvalia_BlackGeyser_Charge;
			}
			//If the current sprite is charging
			else if (sprite_index == spr_Malvalia_BlackGeyser_Charge)
			{
				//When the charging is finished, switch to attacking state
				if (image_index >= image_number - 1)
				{
					image_index = 0;
					sprite_index = spr_Malvalia_BlackGeyser_Attack;
				}
			}
			//If the current sprite is attacking
			else if (sprite_index == spr_Malvalia_BlackGeyser_Attack)
			{
				//If this state hasnt gone long enough
				if !(Malvalia_FirstFight_BlackGeyser_StateTimer++ > Malvalia_FirstFight_BlackGeyser_StateTimerLimit)
				{
					//If its time to create a new Black Geyser
					if (Malvalia_FirstFight_BlackGeyser_CreateTimer++ > Malvalia_FirstFight_BlackGeyser_CreateTimerLimit)
					{
						
						//Create a Black Geyser Conjurer
						var _createBlackGeyserX = obj_Player.x + floor(random_range(1, -1) * 128)// irandom_range(128, 832);
						var _createBlackGeyserY = 476;
						Malvalia_FirstFight_BlackGeyser_ConjureParticle = CreateParticleSystem(ps_Malvalia_BlackGeyser_Charge, "Black_Geyser", _createBlackGeyserX, _createBlackGeyserY, false);
						
						//Create a Black Geyser
						TimeSourceCreateAndStart(Malvalia_FirstFight_BlackGeyser_ConjureTime, MalvaliaBossBattle_BlackGeyser, [_createBlackGeyserX, _createBlackGeyserY], 1);
						
						Malvalia_FirstFight_BlackGeyser_CreateTimer = 0;
					}
				
				}//end state not finished
				
				//If its time to stop summoning Black Geysers
				else
				{
					Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.IDLE;
					Malvalia_FirstFight_BlackGeyser_StateTimer = 0;
					Malvalia_FirstFight_BlackGeyser_CreateTimer = 0;
				}
				
			}//end current sprite attacking
		
		#endregion
		
		break;//end Black Geyser State
		
}//end Malvalia State machine




