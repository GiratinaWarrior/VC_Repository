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
		
		//The true main theme
		case music_MainTheme:
			
			with (obj_PlayBGM)
			{
				BGM_Volume = 1;
				BGM_GainRate = 0;
			}
			
			break;//end main theme
		
		#region Misc
		
			case blanksound:
			
			with (obj_PlayBGM)
			{
				BGM_Volume = 0;
				BGM_GainRate = 300;
			}
			
			break;//end blanksound
			
			case music_Credits:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 1;
				BGM_GainRate = 0;
			}
			
			break;
		
		#endregion
		
		#region Prologue Arc / Shrine Themes
		
			case music_ShrineMemoryTheme:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.3;
					BGM_GainRate = 200;
				}
		
				break;
		
			//If the Valnyx Shrine theme is playing
			case music_ShrinePeacefulTheme:
			
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.5;
					BGM_GainRate = 0;
				}
			
				break;//end Valnyx Shrine Theme
			
			//If Jest's encounter theme is playing
			case music_JestEncounterTheme:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.2;
					BGM_GainRate = 0;
				}
		
				break;//end Jest Encounter Theme
			
			//If the Shrine General's battle theme is laying
			case music_ShrineGeneralTheme:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.4;
					BGM_GainRate = 0;
				}
		
				break;
			
			case music_LavenderEncounterTheme:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.4;
					BGM_GainRate = 0;
				}
			
				break;
			
			case music_ShrineBasementTheme:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.5;
					BGM_GainRate = 0;
				}
			
				break;
			
			case music_StoryCutsceneTheme:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.5;
					BGM_GainRate = 0;
				}
		
				break;
			
			case music_LavenderBattleTheme:
			
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.5;
					BGM_GainRate = 0;
				}
			
				break;
			
			case music_NoctisCityTheme:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.6;
					BGM_GainRate = 10;
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
					BGM_GainRate = 100;
				}
		
				break;
			
			case music_VoizatiaEncounterTheme:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.9;
					BGM_GainRate = 100;
				}
			
				break;
			
			case music_LavenderDeathTheme:
			
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.3;
					BGM_GainRate = 0;
				}
			
				break;
			
			case music_LavenderDeathThemeV2:
			
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.5;
					BGM_GainRate = 0;
				}
			
				break;
			
		#endregion Prologue Themes
		
		#region Universal
		
			case music_VoizatiaEncounterThemeV2:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.2;
					BGM_GainRate = 0;
				}
			
				break;
			
			case music_VlastelTheme:
		
				with (obj_PlayBGM)
				{
					BGM_Volume = 1.2;
					BGM_GainRate = 0;
				}
		
				break;
			
		#endregion
		
		#region Field Arc
		
			case music_SomniumFieldTheme:
				
				with (obj_PlayBGM)
				{
					BGM_Volume = 0.7;
					BGM_GainRate = 100;
				}
				
				break;
		
		#endregion
		
		default:
		
			with (obj_PlayBGM)
			{
				BGM_Volume = 1;
				BGM_GainRate = 0;
			}
		
			break;
		
	}
	
}