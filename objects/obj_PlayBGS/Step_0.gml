/// @description Play the background sound effects

//If the current track is not the same is the next track
if (CurrentBGS != NextBGS && NextBGS != undefined && CurrentBGS != undefined) 
{
	if (audio_sound_get_gain(CurrentBGS) > 0) //Check If It's Gain (audible level) is Above 0
	{
		audio_sound_gain(CurrentBGS, 0, BGS_GainRate/10); //Fade Out Previous Track
	}
	else
	{
		
	    audio_stop_sound(CurrentBGS); //Stop Song
	    audio_sound_gain(CurrentBGS, 1, 0); //Reset Gain
	    CurrentBGS = NextBGS; //Assign New Song
	    NextBGS = undefined; //Empty Variable
	    audio_play_sound(CurrentBGS, 1000, true); //Play New Song
		audio_sound_gain(CurrentBGS, 0, 0);
		audio_sound_gain(CurrentBGS, BGS_Volume, BGS_GainRate);
	}
}
