/// @description SetRoomAudio(BGM, BGS)
/// @param BackgroundMusic
/// @param BackgroundSounds
/// @param MusicFadeIn
/// @param SoundsFadeIn
function SetRoomAudio(_roommusic = blanksound, _roomsounds = blanksound, _musicGain = 1000, _soundsGain = 1000){

	with (obj_PlayBGM)
	{
		NextBGM = _roommusic; 
		BGM_GainRate = _musicGain;
	}

	with (obj_PlayBGS)
	{
		NextBGS = _roomsounds;
		BGS_GainRate = _soundsGain;
	}

}