/// @description Insert description here
// You can write your code in this editor

RougeSpear_Layer = layer_create(layer_get_depth("VoizatiaBossIntroCutscene_Voizatia") - 1, "RougeSpear"); 
SinEruption_Layer =  layer_create(layer_get_depth("VoizatiaBossIntroCutscene_Voizatia") - 1, "SinEruption");

VoizatiaBossPrologue_CurrentState = VOIZATIABOSSPROLOGUE_STATE.IDLE;
VoizatiaBossPrologue_NextState = VOIZATIABOSSPROLOGUE_STATE.ROUGE_SPEAR;

enum VOIZATIABOSSPROLOGUE_STATE
{
	IDLE,
	ROUGE_SPEAR,
	SIN_ERUPTION,
}

xSpeed = 0;
ySpeed = 0;
Gravity = 0;

VoizatiaBossPrologue_StateChangeTimer = 0;
VoizatiaBossPrologue_StateChangeTimerLimit = 50;

//----------------Idle State----------------//

VoizatiaBossPrologue_InRangeSword = false;
VoizatiaBossPrologue_InRangeCannon = false;

VoizatiaBossPrologue_TeleportLayer = "VoizatiaBossShadowTeleport";
VoizatiaBossPrologue_Teleport_Done = false;

VoizatiaBossPrologue_Teleport_XDist = 0;
VoizatiaBossPrologue_Teleport_YDist = 0;

//-------------Rouge Spear State------------//

//The settings for the rouge spear
VoizatiaBossPrologue_RougeSpear_Direction = 0;
VoizatiaBossPrologue_RougeSpear_Speed = 9;
VoizatiaBossPrologue_RougeSpear_InitialDistance = 200;

//Counting the number of spears thrown
VoizatiaBossPrologue_RougeSpear_SpearsThrown = 0;
VoizatiaBossPrologue_RougeSpear_MaxSpears = 20;

//Counter for how often the spears are thrown in between
VoizatiaBossPrologue_RougeSpear_FireRate = 15;
VoizatiaBossPrologue_RougeSpear_FireCooldown = 0;

//How long it takes the spear to manifest
VoizatiaBossPrologue_RougeSpear_AppearRate = 1/VoizatiaBossPrologue_RougeSpear_FireRate;

//---------Sin Eruption State--------------//

//how long the state lasts for
VoizatiaBossPrologue_SinEruption_StateTimer = 0;
VoizatiaBossPrologue_SinEruption_StateTimerLimit = 400;

//how often Sin Eruptions are foreshadowed
VoizatiaBossPrologue_SinEruption_AttackTimer = 0;
VoizatiaBossPrologue_SinEruption_AttackTimerLimit = 30;

//how long it takes the Sin Eruption to appear after warning
VoizatiaBossPrologue_SinEruption_ConjureTimer = VoizatiaBossPrologue_SinEruption_AttackTimerLimit - 10;
VoizatiaBossPrologue_SinEruption_ConjureParticle = noone;

//The number of Sin Eruptions to use at a time
VoizatiaBossPrologue_SinEruption_NumOfAttack = 4;

VoizatiaBossPrologue_SinEruption_X = 0;
VoizatiaBossPrologue_SinEruption_Y = 352;

VoizatiaBossPrologue_SinEruptionCreateFunction = function()
{
	audio_play_sound(sound_SinEruption, 90, false, 0.5);
						
	instance_create_layer(VoizatiaBossPrologue_SinEruption_X, VoizatiaBossPrologue_SinEruption_Y, SinEruption_Layer, obj_SinEruption);
}

VoizatiaBossPrologue_SinEruption_TimeSource 
= TimeSourceCreate(VoizatiaBossPrologue_SinEruption_ConjureTimer, VoizatiaBossPrologue_SinEruptionCreateFunction, [], -1);

