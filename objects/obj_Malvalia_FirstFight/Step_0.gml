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
				Malvalia_FirstFight_Teleport_TargetX = irandom_range(128, 832);
				Malvalia_FirstFight_Teleport_TargetY = irandom_range(270, 405);
				Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.TELEPORT;
				Malvalia_FirstFight_Teleport_Timer = 0;
			}
			
			//If the attack state timer is finished, change to an attacking state
			else if (Malvalia_FirstFight_Idle_StateChangeTimer++ > Malvalia_FirstFight_Idle_StateChangeTimerLimit)
			{
				Malvalia_FirstFight_Idle_StateChangeTimer = 0; 
			//	Malvalia_FirstFight_CurrentState = Malvalia_FirstFight_NextState;
				switch(Malvalia_FirstFight_NextState)
				{
					case MALVALIA_FIRSTFIGHT_STATE.BLACK_GEYSER:
						Malvalia_FirstFight_CurrentState = Malvalia_FirstFight_NextState;
						break;
					
					case MALVALIA_FIRSTFIGHT_STATE.RED_NEEDLES:
						
						Malvalia_FirstFight_RedNeedles_TeleportedToCenter = false;
						Malvalia_FirstFight_CurrentState = Malvalia_FirstFight_NextState;
					
						var _func = function()
						{
							Malvalia_FirstFight_CurrentState = Malvalia_FirstFight_NextState//MALVALIA_FIRSTFIGHT_STATE.RED_NEEDLES;
						}
						//MalvaliaBossBattle_Teleport(room_width/2, room_height/2, _func);
						break;
					
				}
			}
					
		#endregion
		
		break;//end Idle State
		
	//Teleport State: Malvalia teleports elsewhere
	case MALVALIA_FIRSTFIGHT_STATE.TELEPORT:
		
		#region Teleport
			
			var _func = function()
			{
				Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.IDLE;
			}
			
			MalvaliaBossBattle_Teleport(Malvalia_FirstFight_Teleport_TargetX, Malvalia_FirstFight_Teleport_TargetY, _func);
			
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
						
						var _createBlackGeyserX;
						
						if (instance_exists(obj_Player))
						{
							//Create a Black Geyser Conjurer
							_createBlackGeyserX = obj_Player.x + floor(random_range(1, -1) * Malvalia_FirstFight_BlackGeyser_Range) //irandom_range(128, 832);
						}
						else
						{
							_createBlackGeyserX = irandom_range(128, 832);
						}
						
						var _createBlackGeyserY = 476;
						Malvalia_FirstFight_BlackGeyser_ConjureParticle = CreateParticleSystem(ps_Malvalia_BlackGeyser_Charge, "Black_Geyser", _createBlackGeyserX, _createBlackGeyserY, false);
						audio_play_sound(sound_BlackGeyser_Charge, 100, false);
						
						//Create a Black Geyser
						TimeSourceCreateAndStart(Malvalia_FirstFight_BlackGeyser_ConjureTime, MalvaliaBossBattle_BlackGeyser, [_createBlackGeyserX, _createBlackGeyserY], 1);
						
						Malvalia_FirstFight_BlackGeyser_CreateTimer = 0;
					}
				
				}//end state not finished
				
				//If its time to stop summoning Black Geysers
				else
				{
					Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.IDLE;
					Malvalia_FirstFight_NextState = MALVALIA_FIRSTFIGHT_STATE.RED_NEEDLES;
					Malvalia_FirstFight_BlackGeyser_StateTimer = 0;
					Malvalia_FirstFight_BlackGeyser_CreateTimer = 0;
					Malvalia_FirstFight_Idle_StateChangeTimer = 0;		
				}
				
			}//end current sprite attacking
		
		#endregion
		
		break;//end Black Geyser State
		
	//Red Needle State: Malvalia teleports to the center and uses Red Needles
	case MALVALIA_FIRSTFIGHT_STATE.RED_NEEDLES:
	
		#region Red Needles
			
			if !(Malvalia_FirstFight_RedNeedles_TeleportedToCenter)
			{
				var _func = function()
				{
					Malvalia_FirstFight_RedNeedles_TeleportedToCenter = true;
				}
				MalvaliaBossBattle_Teleport(room_width/2, room_height/4, _func);
			}
			
			else if (Malvalia_FirstFight_RedNeedles_TeleportedToCenter)
			{
			
				//If the current sprite is flying
				if (sprite_index == spr_Malvalia_Fly)
				{
					image_index = 0;
					sprite_index = spr_Malvalia_RedNeedles_Charge;
				}
				//If the current sprite is charging
				else if (sprite_index == spr_Malvalia_RedNeedles_Charge)
				{
					//When the charging is finished, switch to attacking state
					if (image_index >= image_number - 1)
					{
						image_index = 0;
						sprite_index = spr_Malvalia_RedNeedles_Attack;
					}
				}
				//If the current sprite is attacking
				else if (sprite_index == spr_Malvalia_RedNeedles_Attack)
				{
				
					//If this state hasnt gone long enough
					if !(Malvalia_FirstFight_RedNeedles_StateTimer++ > Malvalia_FirstFight_RedNeedles_StateTimerLimit)
					{
						
						var _AngleFromPlayer;
						
						if (instance_exists(obj_Player))
						{
							_AngleFromPlayer = point_direction(x, y, obj_Player.x, obj_Player.y);
						}
						else
						{
							_AngleFromPlayer = irandom_range(0, 360);
						}
						//If its time to shoot for Red Needles
						if (Malvalia_FirstFight_RedNeedles_ShootTimer++ > Malvalia_FirstFight_RedNeedles_ShootTimerLimit)
						{
						
							
							var _NeedleDir = _AngleFromPlayer + (random_range(1, -1) * 20);
						
							MalvaliaBossBattle_RedNeedles(_NeedleDir, 5);
						
							Malvalia_FirstFight_RedNeedles_ShootTimer = 0;
						}
					
					}//end state gone long enough
				
					//If its time to end this state
					else
					{
						image_index = 0;
						sprite_index = spr_Malvalia_RedNeedles_Rewind;
					}
				
				}
				//If the current sprite is rewinding
				else if (sprite_index == spr_Malvalia_RedNeedles_Rewind)
				{
					if (image_index >= image_number - 1)
					{
						Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.IDLE;
						Malvalia_FirstFight_NextState = MALVALIA_FIRSTFIGHT_STATE.BLACK_GEYSER;
						Malvalia_FirstFight_RedNeedles_ShootTimer = 0;
						Malvalia_FirstFight_RedNeedles_StateTimer = 0;
					}
				}
				
			}
			
		#endregion
	
		break;//end Red Needles State
		
	//Defeated State: Malvalia has been defeated
	case MALVALIA_FIRSTFIGHT_STATE.DEFEATED:
		
		#region Defeated
			
			SetRoomAudio_Music_Default(blanksound);
			
			Damage = 0;
			
			//Fall towards the ground
			y += ySpeed;
			ySpeed += Gravity;
			Wall_FallOn();
			
			with (obj_Player)
			{
				if (place_meeting(x, y, obj_Malvalia_FirstFight))
				{
					if (x >= other.x)
					{
						x = other.x + 32;
					}
					else
					{
						x = other.x - 32;
					}
				}
					
			}
			
			obj_Player.image_xscale = -sign(obj_Player.x - x);
			
			//If Malvalia hits the ground
			if (place_meeting(x, y + ySpeed + 1, obj_Wall) && sprite_index != spr_Malvalia_Fell)
			{
				
				var _contCutscene = function()
				{
					//Activate the next stage of the cutscene
					with (obj_MalvaliaFirstFightCutscene)
					{
						MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHTCUTSCENE.MALVALIA_DEFEATED_TALK;
					}
				}
				
				//After a certain amount of time has passed, activate the next stage of the cutscene
				TimeSourceCreateAndStart(80, _contCutscene, [], 1);
				
				//Change the sprite
				sprite_index = spr_Malvalia_Fell;
				
			}//end Malvalia hit ground
		
		#endregion
		
		break;//end Defeated State
		
}//end Malvalia State machine




