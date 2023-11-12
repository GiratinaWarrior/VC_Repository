// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function VoizatiaBossPrologue_Teleport(_returnfunc = EmptyFunction()){
	
	var _leftBoundary = obj_Camera.x - (RES_W/2) + (sprite_width/2) + 15;
	var _rightBoundary = obj_Camera.x + (RES_W/2) - (sprite_width/2) - 15;

	var _upperBoundary = (sprite_height/2) + 15;
	var _lowerBoundary = 352 - (sprite_height/2) - 15;
	
	if !(VoizatiaBossPrologue_Teleport_Done)
	{
		layer_set_visible(VoizatiaBossPrologue_TeleportLayer, true);
		Enemy_Invincible = true;
							
		VoizatiaBossPrologue_Teleport_XDist = x - obj_Player.x;
		VoizatiaBossPrologue_Teleport_YDist = y - obj_Player.y;
							
		if (x - VoizatiaBossPrologue_Teleport_XDist < _leftBoundary || x - VoizatiaBossPrologue_Teleport_XDist > _rightBoundary)
		{
			x += (VoizatiaBossPrologue_Teleport_XDist * 2);
		}
		else
		{
			x -= VoizatiaBossPrologue_Teleport_XDist;
		}
							
		if (y - VoizatiaBossPrologue_Teleport_YDist < _upperBoundary|| y - VoizatiaBossPrologue_Teleport_YDist > _lowerBoundary)
		{
			y += (VoizatiaBossPrologue_Teleport_YDist * 1);
		}
		else
		{
			y -= VoizatiaBossPrologue_Teleport_YDist;
		}
							
		VoizatiaBossPrologue_Teleport_Done = true;
		visible = false;
	}
						
	var _func = function(_anotherfunc = EmptyFunction)
	{
		visible = true;
		layer_set_visible(VoizatiaBossPrologue_TeleportLayer, false);
		Enemy_Invincible = false;
		VoizatiaBossPrologue_Teleport_Done = false;
		_anotherfunc();
	}
						
	TimeSourceCreateAndStart(10, _func, [_returnfunc]);
	
}
	
function VoizatiaBossPrologue_RougeSpear()
{
	
	//Check if the maximum number of spears have been thrown yet, and if not, proceed
	if (VoizatiaBossPrologue_RougeSpear_SpearsThrown <= VoizatiaBossPrologue_RougeSpear_MaxSpears)
	{
		//If its time to throw a new spear
		if (VoizatiaBossPrologue_RougeSpear_FireCooldown++ > VoizatiaBossPrologue_RougeSpear_FireRate)
		{
			
			VoizatiaBossPrologue_RougeSpear_Direction = random_range(180, 360);
			
			var _spearX = obj_Player.x - lengthdir_x(VoizatiaBossPrologue_RougeSpear_InitialDistance, VoizatiaBossPrologue_RougeSpear_Direction);
			var _spearY = obj_Player.y - lengthdir_y(VoizatiaBossPrologue_RougeSpear_InitialDistance, VoizatiaBossPrologue_RougeSpear_Direction);
			
			with (instance_create_layer(_spearX, _spearY, "RougeSpear", obj_RougeSpear))
			{
				image_alpha = 0;
				VoizatiaBossPrologue_RougeSpear_AppearRate = other.VoizatiaBossPrologue_RougeSpear_AppearRate;
				image_angle = other.VoizatiaBossPrologue_RougeSpear_Direction;
				
				VoizatiaBossPrologue_RougeSpear_Direction = other.VoizatiaBossPrologue_RougeSpear_Direction;
				VoizatiaBossPrologue_RougeSpear_Speed = other.VoizatiaBossPrologue_RougeSpear_Speed;
				
			}
			
			VoizatiaBossPrologue_RougeSpear_FireCooldown = 0;
			VoizatiaBossPrologue_RougeSpear_SpearsThrown++;
			
		}//end throw new spear
		
	}//end maximum not reached
	
	//If all of the spears have been thrown
	else
	{
		VoizatiaBossPrologue_CurrentState = VOIZATIABOSSPROLOGUE_STATE.IDLE;
		VoizatiaBossPrologue_NextState = VOIZATIABOSSPROLOGUE_STATE.SIN_ERUPTION;
		VoizatiaBossPrologue_RougeSpear_FireCooldown = 0;
		VoizatiaBossPrologue_RougeSpear_SpearsThrown = 0;
	}//end all spears thrown
	
}//end function

function VoizatiaBossPrologue_SinEruption()
{
	
	//If Voizatia is idle, start the charge stage
	if (sprite_index == spr_Voizatia_Fly)
	{
		image_index = 0;
		sprite_index = spr_Voizatia_SinEruption_Charge;
	}
	
	//if Voizatia is charging, if the animation has ended, start the attack stage
	else if (sprite_index == spr_Voizatia_SinEruption_Charge)
	{
		if (image_index >= image_number - 1)
		{			
			image_index = 0;
			sprite_index = spr_Voizatia_SinEruption_Attack;
		}
	}
	
	//If Voizatia is currently attacking
	else if (sprite_index == spr_Voizatia_SinEruption_Attack)
	{
	
		//If the attack state is still ongoing
		if (VoizatiaBossPrologue_SinEruption_StateTimer++ < VoizatiaBossPrologue_SinEruption_StateTimerLimit)
		{
			//If its time to summon a Sin Eruption
			if (VoizatiaBossPrologue_SinEruption_AttackTimer++ > VoizatiaBossPrologue_SinEruption_AttackTimerLimit)
			{
				
				if (PlayerAlive()) VoizatiaBossPrologue_SinEruption_X = obj_Player.x;
				else VoizatiaBossPrologue_SinEruption_X = irandom_range(500, 1400);
				
				audio_play_sound(sound_SinEruptionWarning, 40, false, 0.3);
					
				VoizatiaBossPrologue_SinEruption_ConjureParticle = CreateParticleSystem(ps_SinEruptionWarning, "SinEruption", VoizatiaBossPrologue_SinEruption_X, 0);
				
				time_source_start(VoizatiaBossPrologue_SinEruption_TimeSource)
				
				//VoizatiaBossPrologue_SinEruption_NumOfAttack++;
				VoizatiaBossPrologue_SinEruption_AttackTimer = 0;
			}//end summon SE
			
		}//end attack state ongoing
		
		//if its time to stop the attack
		else
		{
			time_source_stop(VoizatiaBossPrologue_SinEruption_TimeSource);
			VoizatiaBossPrologue_CurrentState = VOIZATIABOSSPROLOGUE_STATE.IDLE;
			VoizatiaBossPrologue_NextState = VOIZATIABOSSPROLOGUE_STATE.ROUGE_SPEAR;
			VoizatiaBossPrologue_SinEruption_AttackTimer = 0;
			VoizatiaBossPrologue_SinEruption_StateTimer = 0;
			VoizatiaBossPrologue_SinEruption_NumOfAttack = 0;
			part_particles_clear(VoizatiaBossPrologue_SinEruption_ConjureParticle);
		}//end stop attack state
		
		
	}//end Voizatia attacking
	
}//end function()