
var _func = function()
{
	TransitionStart(Room_TitleScreen, seq_FadeOut, seq_FadeIn);
	time_source_destroy(TransToTitle);
}
TransToTitle = TimeSourceCreateAndStart(40, _func);

randomize();