/// @description

enum MYSTICASIAGUARD_CUTSCENE_STAGE
{
	GUARD_HALT,
	GUARD_DEFENSIVE,
	GUARD_TALK_FIRST,
	PAUSE,
	GUARD_RELAX,
	GUARD_PERMIT_ENTRY,
	OPEN_GATE,
	CUTSCENE_END,
}

enum MYSTICASIAGUARD_CUTSCENE_PAUSE_STAGE
{
	DOTS,
	EXCLAIM
}


MysticasianGuardCutscene_Stage = 0;

MysticasianGuardCutscene_Pause_Stage = 0;

MysticasianGuardCutscene_GuardHaltStarted = false;

MysticasianGuardCutscene_GuardTalkStarted = false;

Guard = Mysticasia_VillageGateGuard;

MysticasianGuardCutscene_Pause_TripleDots = noone;
MysticasianGuardCutscene_Pause_Exclaim = noone;

MysticasianGuardCutscene_GuardPermitEntryStarted = false;

MysticasianGuardCutscene_OpenGate_TimeSource = noone;

