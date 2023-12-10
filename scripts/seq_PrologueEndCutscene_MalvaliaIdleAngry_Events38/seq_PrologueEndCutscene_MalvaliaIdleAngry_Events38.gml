// Auto-generated stubs for each available event.

function PrologueEndCutscene_MalvaliaEndAngry_Function()
{
	with (obj_PrologueEndCutscene)
	{
		if (PrologueEndCutscene_Stage == PROLOGUE_END_CUTSCENE.MALVALIA_EXIT_TALK) && !(PrologueEndCutscene_MalvaliaCalm)
		{
			layer_sequence_destroy(PrologueEndCutscene_MalvaliaIdle);
			PrologueEndCutscene_MalvaliaIdle = layer_sequence_create(layer, x, y, seq_PrologueEndCutscene_MalvaliaIdle);
			PrologueEndCutscene_MalvaliaCalm = true;
		}
	}
}