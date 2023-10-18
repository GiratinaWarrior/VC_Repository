if (global.Lavender_Defeated_Prologue)
{
	instance_destroy();
}

eventFunc = function()
{
	with (obj_LavenderBossIntro_Prologue)
	{
		LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.CAMERA_PAN;
	}
}