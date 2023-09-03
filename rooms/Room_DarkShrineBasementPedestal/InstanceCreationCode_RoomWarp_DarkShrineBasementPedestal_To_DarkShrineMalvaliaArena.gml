target = Room_DarkShrineMalvaliaArena;
WarpX = 256;
WarpY = 190 + 270;
ExitSequence = seq_MalvaliaBattleOut;
EnterSequence = seq_MalvaliaBattleIn;
targetIsCutScene = true;

if (global.MalvaliaDefeated)
{
	instance_destroy();
}