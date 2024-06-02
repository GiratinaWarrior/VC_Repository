	
if !(global.PrologueEnd_Cutscene_Seen)
{
	target = Room_PrologueEndingCutscene;
	WarpX = 960;
	WarpY = 492;
	targetIsCutScene = true;
}
else
{
	target = Room_NoctisCity_FieldTunnel;
	WarpX = 64;
	WarpY = 400;
}