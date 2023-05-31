/// @description SetRoomAudio(BGM, BGS)
/// @param BackgroundMusic
/// @param BackgroundSounds
function SetRoomAudio(_roommusic = blanksound, _roomsounds = blanksound){

	with (obj_PlayBGM)
	{
		NextBGM = _roommusic; 
	}

	with (obj_PlayBGS)
	{
		NextBGS = _roomsounds;
	}

}