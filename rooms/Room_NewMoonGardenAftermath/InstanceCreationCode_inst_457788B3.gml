if (global.VoizatiaLavenderAftermath_Cutscene_Seen)
{
	instance_destroy();
}

eventFunc = function()
{

	with (obj_VoizatiaLavenderAftermathCutscene)
	{
		VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.CAMERA_PAN;
	}
	
}