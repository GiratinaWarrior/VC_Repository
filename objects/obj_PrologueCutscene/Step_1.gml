/// @description Pause the sequence while text is displayed

if (instance_exists(obj_Text))
{
	layer_sequence_pause(PrologueCutsceneSequenceID);
}
else
{
	layer_sequence_play(PrologueCutsceneSequenceID);
}