//instance_destroy();

if (global.MalvaliaDefeated)
{
	instance_destroy();
}



target = Room_DarkShrineMalvaliaArena;
WarpX = 240;
WarpY = 464;
ExitSequence = seq_MalvaliaBattleOut;
EnterSequence = seq_MalvaliaBattleIn;
targetIsCutScene = true;