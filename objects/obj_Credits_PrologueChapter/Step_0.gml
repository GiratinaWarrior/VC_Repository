/// @description

if (Credits_PrologueChapter_CreditSequenceCreated) && (layer_sequence_is_finished(Credits_PrologueChapter_CreditSequence))
{
	SetRoomAudio_Music_Default(blanksound);
	PlayerTransition(Room_TitleScreen, 0, 0, seq_FadeOut, seq_FadeIn, true);
	DeleteSave();
}






