/// @description Pause the sequence while text is displayed
var _seq = layer_sequence_create("Lavender", 0, 0, seq_PrologueCutscene);

if (instance_exists(obj_Text))
{
	layer_sequence_pause(_seq);
}