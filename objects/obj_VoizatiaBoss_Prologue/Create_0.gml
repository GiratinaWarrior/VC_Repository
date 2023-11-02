/// @description Insert description here
// You can write your code in this editor

layer_create(layer_get_depth("VoizatiaBossIntroCutscene_Voizatia"), "RougeSpear"); 

VoizatiaBossPrologue_CurrentState = VOIZATIABOSSPROLOGUE_STATE.IDLE;
VoizatiaBossPrologue_NextState = VOIZATIABOSSPROLOGUE_STATE.ROUGE_SPEAR;

enum VOIZATIABOSSPROLOGUE_STATE
{
	IDLE,
	ROUGE_SPEAR,
	SIN_ERUPTION,
	BLACK_HOLE
}

xSpeed = 0;
ySpeed = 0;
Gravity = 0;

VoizatiaBossPrologue_StateChangeTimer = 0;
VoizatiaBossPrologue_StateChangeTimerLimit = 300;

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
VoizatiaBossPrologue_RougeSpear_Speed = 6;
VoizatiaBossPrologue_RougeSpear_InitialDistance = 200;

//Counting the number of spears thrown
VoizatiaBossPrologue_RougeSpear_SpearsThrown = 0;
VoizatiaBossPrologue_RougeSpear_MaxSpears = 20;

//Counter for how often the spears are thrown in between
VoizatiaBossPrologue_RougeSpear_FireRate = 15;
VoizatiaBossPrologue_RougeSpear_FireCooldown = 0;

//How long it takes the spear to manifest
VoizatiaBossPrologue_RougeSpear_AppearRate = 1/VoizatiaBossPrologue_RougeSpear_FireRate;


