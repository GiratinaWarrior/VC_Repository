target = Room_DarkShrineBasementPedestal;
WarpY = 448 + 16;

if (!global.VoizatiaDebuted)
{
	WarpX = -32;
	targetIsCutScene = true;
	
	WarpX = 32;
	targetIsCutScene = false;
	
}
else if !(global.MalvaliaDefeated)
{
	WarpX = 32;
}
else
{
	WarpX = 32;
}