/// @description Play the music

//If the current track is not the same is the next track
if (CurrentBGM != NextBGM && NextBGM != undefined && CurrentBGM != undefined) 
{
	if (audio_sound_get_gain(CurrentBGM) > 0) //Check If It's Gain (audible level) is Above 0
    {
        audio_sound_gain(CurrentBGM, 0, 100); //Fade Out Previous Track
    }
    else
    {
		
        audio_stop_sound(CurrentBGM); //Stop Song
        audio_sound_gain(CurrentBGM, 1, 0); //Reset Gain
        CurrentBGM = NextBGM; //Assign New Song
        NextBGM = undefined; //Empty Variable
        audio_play_sound(CurrentBGM, 500, true); //Play New Song
		audio_sound_gain(CurrentBGM, 0, 0);
		audio_sound_gain(CurrentBGM, 0.5, 1000);
    }
}
