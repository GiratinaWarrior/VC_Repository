if (global.VoizatiaLavenderAftermath_Cutscene_Seen)
{
	instance_destroy();
}

eventFunc = function()
{

	with (obj_VoizatiaBossIntroCutscene)
	{
		VoizatiaBossIntro_State = VOIZATIABOSSINTRO.CAMERA_PAN;
	}
	
}