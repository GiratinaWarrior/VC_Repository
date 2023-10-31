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
	
/////This function sets the room audio, and uses the default settings for them
function SetRoomAudio_Music_Default(_music = blanksound){
	
	with (obj_PlayBGM)
	{
		NextBGM = _music;
	}
	
	//Set the music settings depending on the track
	switch(_music)
	{
		//If no music is playing
		case blanksound:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.05;
				BGM_GainRate = 1000;
			}
			
			break;//end no music
		
		//If the Valnyx Shrine theme
		case music_ShrinePeacefulTheme:
			
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.5;
				BGM_GainRate = 100;
			}
			
			break;//end Valnyx Shrine
			
		case music_JestEncounterTheme:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.3;
				BGM_GainRate = 0;
			}
		
			break;
			
		case music_LavenderEncounterTheme:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.4;
				BGM_GainRate = 1000;
			}
			
			break;
			
		case music_ShrineBasementTheme:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.5;
				BGM_GainRate = 0;
			}
			
			break;
			
		case music_NoctisCityTheme:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.5;
				BGM_GainRate = 1000;
			}
		
			break;
			
		case music_HighStakesPanic:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.25;
				BGM_GainRate = 0;
			}
			
			break;
			
		case music_DarkShrineBasementTheme:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.3;
				BGM_GainRate = 500;
			}
		
			break;
			
		case music_VoizatiaEncounterTheme:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.9;
				BGM_GainRate = 100;
			}
			
			break;
			
		case music_VoizatiaEncounterThemeV2:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.2;
				BGM_GainRate = 100;
			}
			
			break;
			
		case music_NightfallKnightTheme:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.5;
				BGM_GainRate = 0;
			}
		
			break;
			
		case music_Credits:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 1;
				BGM_GainRate = 0;
			}
			
			break;
			
		case music_LavenderBattleTheme:
			
			with (obj_PlayBGM)
			{
				BGM_Volume = 0.2;
				BGM_GainRate = 0;
			}
			
			break;
		
	}
	
}