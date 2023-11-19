if (global.ShrineGeneral_Defeated)
{
	instance_destroy();
}

eventFunc = function()
{
	with (obj_ShrineGeneralBossIntro)
	{
		ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.CAMERA_PAN;
	}
}