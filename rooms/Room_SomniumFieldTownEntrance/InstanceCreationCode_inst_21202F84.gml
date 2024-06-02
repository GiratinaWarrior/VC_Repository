
if (global.MysticasiaGuard_Cutscene_Seen) instance_destroy();

eventFunc = function()
{
	if (global.MysticasiaGuard_Cutscene_Seen)
	{
		instance_create_layer(Mysticasia_VillageGateGuard.x, Mysticasia_VillageGateGuard.y, layer, obj_MysticasiaGuardCutscene);
	}
	instance_destroy();
}