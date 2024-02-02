	
if !(global.PrologueEnd_Cutscene_Seen)
{
	target = Room_PrologueEndingCutscene;
	WarpX = 960;
	WarpY = 492;
	targetIsCutScene = true;
}
else
{
	target = Room_SomniumField1;
	WarpX = 32;
	WarpY = 576;
}