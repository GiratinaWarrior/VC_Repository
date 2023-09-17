/// @description

Credits_PrologueChapter_CreditSequence = noone;
Credits_PrologueChapter_CreditSequenceCreated = false;

var _func = function()
{
	Credits_PrologueChapter_CreditSequence = layer_sequence_create(layer, 0, 0, seq_Credits_PrologueChapter);
	SetRoomAudio_Music_Default(music_Credits);
	Credits_PrologueChapter_CreditSequenceCreated = true;
}

TimeSourceCreateAndStart(200, _func, [], 1);




