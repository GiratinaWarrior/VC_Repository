if (global.JestDebut_Cutscene_Seen)
{
	instance_destroy();
}

eventFunc = function()
{
	with (instance_find(obj_JestDebut, 0))
	{
		JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.OFFSCREEN;
	}
}