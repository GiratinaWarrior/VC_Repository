if (!global.VoizatiaDebuted)
{
	eventFunc = function()
	{
		obj_VoizatiaDebutCutscene.VoizatiaDebut_State = VOIZATIADEBUT.CAMERA_PAN;
	}
}
else
{
	instance_destroy();
}