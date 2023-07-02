/// @description SetRoomAudio_Music
/// @param BackgroundMusic
/// @param Volume
/// @param MusicFadeIn
function SetRoomAudio_Music(_roommusic = blanksound, _musicVolume = 0.05, _musicGain = 1000){

	with (obj_PlayBGM)
	{
		NextBGM = _roommusic; 
		BGM_Volume = _musicVolume;
		BGM_GainRate = _musicGain;
	}

}

/// @description SetRoomAudio_Sound
/// @param BackgroundSounds
/// @param Volume
/// @param SoundsFadeIn
function SetRoomAudio_Sounds(_roomsounds = blanksound, _soundsVolume = 0.05, _soundsGain = 1000){

	with (obj_PlayBGS)
	{
		NextBGS = _roomsounds; 
		BGS_Volume = _soundsVolume;
		BGM_GainRate = _soundsGain;
	}

}