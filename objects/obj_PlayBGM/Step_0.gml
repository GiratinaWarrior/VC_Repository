/// @description Play the music

//If the current track is not the same is the next track
if (CurrentBGM != NextBGM && NextBGM != undefined && CurrentBGM != undefined) 
{
	//Check If It's Gain (audible level) is Above 0
	if (audio_sound_get_gain(CurrentBGM) > 0)
    {
		 //Fade Out Previous Track
        audio_sound_gain(CurrentBGM, 0, BGM_GainRate/10);
    }
    else
    {
		
        audio_stop_sound(CurrentBGM); //Stop Song
        audio_sound_gain(CurrentBGM, 1, 0); //Reset Gain
        CurrentBGM = NextBGM; //Assign New Song
        NextBGM = undefined; //Empty Variable
        audio_play_sound(CurrentBGM, 100, true); //Play New Song
		audio_sound_gain(CurrentBGM, 0, 0);
		audio_sound_gain(CurrentBGM, BGM_Volume, BGM_GainRate);
    }
}
