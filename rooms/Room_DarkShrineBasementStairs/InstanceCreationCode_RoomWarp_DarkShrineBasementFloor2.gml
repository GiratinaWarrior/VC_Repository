target = Room_DarkShrineBasementPedestal;
WarpY = 448;

if (!global.VoizatiaDebuted)
{
	WarpX = -32;
	targetIsCutScene = true;
}
else if !(global.MalvaliaDefeated)
{
	WarpX = 32;
}
else
{
	WarpX = 32;
}