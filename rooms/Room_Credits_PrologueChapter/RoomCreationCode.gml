SetRoomAudio_Music_Default(blanksound);

audio_stop_sound(sound_Landing);

with (obj_Player)
{
	hascontrol = false;
	x = room_width/2;
	y = room_height;
}
